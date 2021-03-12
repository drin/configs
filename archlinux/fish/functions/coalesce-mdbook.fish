function coalesce-mdbook
    set mdbook_summary_path "$argv[1]/SUMMARY.md"
    set mdbook_coalesce_path "$argv[2]/coalesced-mdbook.md"

    echo "Coalescing book from: '$mdbook_summary_path' to '$mdbook_coalesce_path'"

    set mdfile_name_grep_regex '(.*?.md)'
    set mdfile_name_sed_regex "s/.*(\([a-z\/-]*.md\).*/$argv[1]\/\1/"

    set mdfiles (grep -P $mdfile_name_grep_regex $mdbook_summary_path | sed $mdfile_name_sed_regex)

    echo "Concatenating markdown files..."
    cat $mdfiles > $mdbook_coalesce_path

    echo "Finished coalescing mdbook"
end
