#!/usr/bin/env python3

"""
## REQUIREMENTS

 * python 3            built-in unicode support helps avoid text processing errors
 * misaka              http://misaka.61924.nl/
 * jinja2              http://jinja.pocoo.org/


## INSTALLATION (note the use of the python 3 specific pip)

```bash
    pip-3.2 install misaka Jinja2
```

This file must be executable

```bash
    chmod 755 misaka_md2html.py
```


## INSTALLATION (method 2)

```bash
    git clone git://github.com/FSX/misaka.git
    cd misaka
    python setup.py install

    git clone git://github.com/mitsuhiko/jinja2.git
    cd jinja2
    ln -s jinja2 /usr/lib/python2.X/site-packages
    As an alternative to steps 4 you can also do python setup.py develop
```

## VIMWIKI SETTINGS (in vimrc):

1. custom_wiki2html should point to this file.
2. path_html must be set
3. syntax should equal 'markdown'
4. css_name should point to the css file you want to use.  This has a default value of style.css so copying the provided style.css from autoload/vimwiki/ to your path_html should be sufficient to get started.




## TODO

Finish implementing template handling.  Will need vimwiki settings info passed for the following
  - vimwiki-option-template_path
  - vimwiki-option-template_default
  - vimwiki-option-template_ext

  http://code.google.com/p/vimwiki/source/detail?name=ba8552ac8864&r=9c8ccb55004d9f563e8fa3f16e6a0207965348cd

To load templates for your application with Jinja2 ...

  > To load templates for your application, the simplest way to configure Jinja2
  > looks like this:
  >
  >     from jinja2 import Environment, PackageLoader
  >     env = Environment(loader=PackageLoader('yourapplication', 'templates'))
  >     template = env.get_template('mytemplate.html')
  >
  > This will create a template environment with the default settings and a
  > loader that looks up the templates in the templates folder inside the
  > yourapplication python package. Different loaders are available and you can
  > also write your own if you want to load templates from a database or other
  > resources.  To load a template from this environment you just have to call
  > the get_template() method which then returns the loaded Template" ...



## CHANGELOG

### 2013-03-16 stu: created gihub project
### 2013-02-03 stu: modify template
### 2013-03-03 stu: add houdini/pygments syntax highlighting http://misaka.61924.nl/manual/

"""

import os.path
import re
import argparse
from misaka import Markdown, HtmlRenderer, HtmlTocRenderer, SmartyPants, \
    EXT_NO_INTRA_EMPHASIS, EXT_TABLES, EXT_FENCED_CODE, EXT_AUTOLINK, \
    EXT_STRIKETHROUGH, EXT_SPACE_HEADERS, \
    EXT_SUPERSCRIPT, \
    HTML_SKIP_HTML, HTML_SKIP_STYLE, HTML_SKIP_IMAGES, HTML_SKIP_LINKS, \
    HTML_EXPAND_TABS, HTML_SAFELINK, HTML_TOC, HTML_HARD_WRAP, \
    HTML_USE_XHTML, HTML_ESCAPE, \
    HTML_SMARTYPANTS
from jinja2 import Template


import houdini as h


# A basic default template to use until the vimwiki template settings are
# fully integrated.
template = Template("""

    <html>
    <head>
    <!-- START HEADER -->
        {% if title %}
            <title>{{ title }}</title>
        {% endif %}

        {% if cssfile %}
            <link href="{{ cssfile }}" rel="stylesheet">
        {% endif %}

        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/sticky-pagination-fixer.js"></script>
        <script type="text/javascript" src="js/run_prettify.js"></script>

        <!-- GCHART hosted GOOGLE.COM -->
        {% if gChartFile %}
            <script type="text/javascript" src="js/jsapi.js"></script>
            <script type="text/javascript" src="js/gChart.js"></script>
        {% endif %}

        <!-- MATHJAX hosted CDN.MATHJAX.ORG -->
        <script type='text/javascript' src='js/MathJax.js'> MathJax.Hub.Config({ extensions: ["tex2jax.js","MathMenu.js","MathZoom.js"], jax: ["input/TeX","output/HTML-CSS"], tex2jax: {inlineMath: [["$","$"], ["\\(","\\)"]], skipTags: ["script","noscript","style","textarea","pre"], processEnvironments: true}, TeX: { extensions: ["AMSmath.js","AMSsymbols.js","noErrors.js","noUndefined.js"] } }); </script>
        <script type='text/javascript' src='js/TeX-AMS_HTML.js'></script>

        <script language="javascript">//<![CDATA[
            $(document).ready(function(){
              $("button#home").click(function(){
                window.location.href="index.html";
              });
              $("button#hdrcontents").click(function(){
                $("div.hdrcontents").toggle();
              });
              $("button#hdrrelated").click(function(){
                $("div.hdrrelated").toggle();
              });
              $("button#back").click(function(){
                history.go(-1);
              });
              $("button#next").click(function(){
                history.go(1);
              });
            });
        //]]></script>

    <!-- END HEADER  -->
    </head>
    <body style="padding: 10px 20px 20px 20px;">
    <!-- START BODY -->
        <header id="sticky-header">
            <div class="mynav">
                <button id="home">主页</button>
                <button id="hdrcontents">目录</button>
                <button id="hdrrelated">相关</button>
                <button id="back">后退</button>
                <button id="next">前进</button>
            </div>
        </header>
        <div class="container">
            <!-- <hr style="padding: 0px 0px 0px 0px; margin: 10px 0px 0px 0px;"> -->
            <!-- TABLE OF CONTENTS -->
            <div class="hdrcontents">
            <h3>目录</h3>
            {% if toc_content %}
            {{ toc_content }}
            {% endif %}
            </div>
            <!-- CONTENTS -->
            {{ main_content }}
        </div>
    <!-- END BODY -->
    </body>
    </html>

""")




if __name__ == '__main__':
    parser = argparse.ArgumentParser( description="Convert vimwiki markdown files to html.")
    parser.add_argument("force", type=int, help="Overwrite any previously " "existing html file.  0 = no, 1 = yes")
    parser.add_argument("syntax", help="The syntax of the file to be " "converted.  The only format  currently supported is markdown. " "So this argument should always be markdown.", choices=["markdown"])
    parser.add_argument("extension", help="The extension of the input file. " "For example: wiki, txt, or md")
    parser.add_argument("outputdir", help="The absolute path to the directory " "where the output html file will be created.")
    parser.add_argument("input_file", type=argparse.FileType('r'), help="The file name (including absolute path) of the markdown " "formatted file to be converted to html.")
    parser.add_argument("cssfile", help="The css file (with absolute path) to " "be referenced in the resulting html file.")

    # TODO:
    parser.add_argument("template_path", help="The full path to the wiki's templates")
    parser.add_argument("template_default", help="The default template name")
    parser.add_argument("template_ext", help="The extension of template files")
    # TODO:
    parser.add_argument("subdir", help="The extension of subdir")

    ns = parser.parse_args()

    input_file = ns.input_file.read()
    input_filename = os.path.basename(ns.input_file.name)
    # split the filename into the name and the extension and just keep the
    # first one -- the name.  Then give it a new .html extension
    output_filename = os.path.splitext(input_filename)[0] + '.html'
    output_file_path = os.path.join(ns.outputdir, output_filename)
    output_file_path = os.path.join(ns.outputdir, output_filename)

    if ns.force or (os.path.exists(output_file_path) != True):

        # Render output
        class LinkPreprocessor(object):
            """Defined to use as a mixin to get the automatic preprocess and
            postprocess handling.

            """
            def process_percent_codes(self, text, patterns):
                """Look for formatting related percent codes in files.

                Keyword arguments:
                text -- the input markdown file as a string
                patterns -- a dictionary of patterns to search for.  The
                            following codes are used:
                                %nohtml
                                %title My Title
                                %toc
                                %template

                """
                self.percent_codes = {}
                for key, value in patterns.items():
                    current_pat = re.compile(value, re.MULTILINE)
                    current_match = current_pat.search(text)
                    if current_match:
                        self.percent_codes[key] = current_match.group(1)
                        #cut out the line with the percent code on it.
                        text = (text[:current_match.start()] +
                                text[current_match.end():])
                    else:
                        self.percent_codes[key] = None
                return text

            def preprocess(self, text):
                """Change wikilinks to regular markdown links.

                Keyword arguments:
                text -- the input markdown file as a string

                This method is automatically called when a renderer is
                rendered.

                The following two wikilink patterns are handled:
                    [[some link text]]
                    [[link|description]]

                and are change to markdown style links like:
                    [some link text](some link text.html)

                """
                wiki_desc_link = '\[\[(?P<link>.+)\|(?P<desc>.+)\]\]'
                desc_pat = re.compile(wiki_desc_link)
                text = desc_pat.sub('[\g<desc>](\g<link>.html)', text)
                simple_wiki_link = '\[\[(?P<link>.+)\]\]'
                simple_pat = re.compile(simple_wiki_link)
                text = simple_pat.sub('[\g<link>](\g<link>.html)', text)

                # each of the regular expression patterns has a named group so
                # we can process them all the same way in a function
                # title will be in the form %title This is the Title
                title_text = '^\s*%title\s+(?P<title>.+)\s*'
                template_text = '^\s*%template\s+(?P<template>.+)\s*'
                # %toc
                toc_text = '^\s*(?P<toc>\[toc\])\s*'
                # %nohtml
                nohtml_text = '^\s*(?P<nohtml>%nohtml)\s*'
                patterns = {'title':title_text, 'toc':toc_text,
                        'no_html':nohtml_text, 'template':template_text}
                text = self.process_percent_codes(text, patterns)
                return text

        class VimwikiTocRenderer(HtmlTocRenderer, LinkPreprocessor):
            pass

        class VimwikiHtmlRenderer(HtmlRenderer, LinkPreprocessor):
            def block_code(self, text, lang):
                return '\n<pre><code class="prettyprint linenums">%s</code></pre>\n' % \
                        h.escape_html(text.strip())
            # 使用run_prettify.js自动识别及高亮

        renderer = VimwikiHtmlRenderer(HTML_TOC)
        to_html = Markdown(renderer, extensions= EXT_NO_INTRA_EMPHASIS |
            EXT_TABLES | EXT_FENCED_CODE | EXT_AUTOLINK |
            EXT_STRIKETHROUGH | EXT_SUPERSCRIPT)
        main_content = to_html.render(input_file)
        if renderer.percent_codes['no_html']:
            print(output_file_path + " not converted due to presence of "
                    "'%nohtml' in the file.")
        else:
            if renderer.percent_codes['toc']:
                toc_renderer = VimwikiTocRenderer()
                to_toc = Markdown(toc_renderer,
                        extensions = EXT_NO_INTRA_EMPHASIS | EXT_AUTOLINK | EXT_SPACE_HEADERS)
                toc_content = to_toc.render(input_file)
            else:
                toc_content = None

            out = open(output_file_path, 'w')
            out.write(template.render({'toc_content':toc_content,
                'main_content':main_content, 'cssfile':ns.cssfile,
                'gChartFile':os.path.join(os.path.dirname(ns.cssfile), 'gChart.js'),
                'title':renderer.percent_codes['title']}))
            out.close()
            print("Converted file to: " + output_file_path)



    else:
        # File exists, do not render
        print("The file already exists and the force argument is not 1.")
