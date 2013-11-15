autocmd FileReadPost    * :set relativenumber
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
