#ctags -R -I ./filter --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q .

if [ $# != 1 ]; then
    echo "Need [Filepath]"
    exit 1
fi

ctags -R -I __THROW -I __THROWNL -I __nonnull -I __nonnull+ \
    -I __attribute__ -I __attribute_deprecated__  \
    -I __attribute_format_arg__ -I __attribute_format_strfmon__ \
    -I __attribute_malloc__ -I __attribute_noinline__ \
    -I __attribute_pure__ -I __attribute_used__ \
    -I __attribute_warn_unused_result__ -I __wur \
    --file-scope=yes \
    --langmap=c:+.h \
    --languages=c,c++ \
    --links=yes \
    --c-kinds=+p \
    --c++-kinds=+p \
    --fields=+iaS \
    --extra=+q \
    "$1"
