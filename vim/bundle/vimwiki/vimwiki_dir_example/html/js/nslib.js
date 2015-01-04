$(document).ready(function(){
    $("a#home").click(function(){
        window.location.href="index.html";
    });
    function toggleToc() {
        $("#left-span").toggle();
        if ($("#right-span").hasClass("span10")) {
            $("#right-span").removeClass();
            $("#right-span").addClass("span12");
        } else {
            $("#right-span").removeClass();
            $("#right-span").addClass("span10");
        }
    }
    $("#toggle-toc").click(function(){
        toggleToc();
    });
    $("a#hdrrelated").click(function(){
        $("div.hdrrelated").toggle();
    });
    $("a#top").click(function(){
        window.location.href="#";
    });
    $("a#back").click(function(){
        history.go(-1);
    });
    $("a#next").click(function(){
        history.go(1);
    });

    String.format = function(src) {
        if (arguments.length == 0) return null;
        var args = Array.prototype.slice.call(arguments, 1);
        return src.replace(/\{(\d+)\}/g, function(m, i){
            return args[i];
        });
    };
    $("#search-text").keyup(function (event){
        if (event.keyCode == '13') {
            $('#search').trigger("click");
        }
    });
    $("#search").click(function(){
        var params = {
            "q": $("#search-text").val()
        }
        $.ajax({
            dataType: 'jsonp',
            jsonp: "jsonpCallback",
            url: 'http://localhost:5000/vimwiki/search',
            type: "GET",
            contentType: "application/json; charset=utf-8",
            data: params,
            success: function(resp) {
                if ($("#right-span").hasClass("span10")) {
                    toggleToc();
                }
                var html = '<h2>搜索结果</h2>';
                for (var i = 0; i < resp.length; ++i) {
                    html += String.format('<a href="{0}">{1}</a><br/>', resp[i], resp[i]);
                }
                $('#right-span').html(html);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert('查找失败');
            }
        })
    });
    $("a", "#left-span > ul").unbind('click');
    function shake(ele, cls, times){
        var i = 0,t= false ,o =ele.attr("class")+" ",c ="",times=times||2;
        if(t) return;
        t= setInterval(function(){
            i++;
            c = i%2 ? o+cls : o;
            ele.attr("class",c);
            if(i==2*times){
                clearInterval(t);
                ele.removeClass(cls);
            }
        }, 150);
    };
    prevTocLink = undefined;
    ori_page_height = $("#right-span").height() - 121;
    $("a", "#left-span > ul").bind('click', function (event) {
        var PADDING_HEADER = 60;
        var s =$(this).attr("href");
        var offset = $(s).offset().top;
        if (prevTocLink != undefined) {
            $(prevTocLink).toggleClass('current');
        }
        prevTocLink = this;
        $(this).toggleClass('current');
        shake($(s), 'current', 5);
        var visable_height = $(window).height();
        if (ori_page_height < offset + visable_height - PADDING_HEADER) {
            $("#right-span").css('height', offset + visable_height - PADDING_HEADER);
        } else {
            $("#right-span").css('height', ori_page_height);
        }
        $("body,html").animate({ scrollTop: offset - PADDING_HEADER }, 200);
        event.preventDefault();
        event.stopPropagation();
    });
    $("#left-span > ul").addClass("collapsibleList");
    CollapsibleLists.apply();

    var flow_charts = $('.ns-flow-chart');
    for (var i = 0; i < flow_charts.length; ++i) {
        var chart_id = 'ns-flow-chart-' + i;
        var code = $(flow_charts[i]).text();
        $(flow_charts[i]).parent().html('<div id="ns-flow-chart-' + i + '"></div>');
        var chart = flowchart.parse(code);
        chart.drawSVG(chart_id);
    }

    var seq_charts = $('.ns-seq-chart');
    for (var i = 0; i < seq_charts.length; ++i) {
        var chart_id = 'ns-seq-chart-' + i;
        var code = $(seq_charts[i]).text();
        $(seq_charts[i]).parent().html('<div id="ns-seq-chart-' + i + '"></div>');
        var chart = Diagram.parse(code);
        chart.drawSVG(chart_id, {theme: 'simple'});
    }
});
