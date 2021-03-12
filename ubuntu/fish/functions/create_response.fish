function create_response
    set response_path 6478-response-(date "+%Y-%m-%d").md
    echo "$response_path"
    touch $response_path
end
