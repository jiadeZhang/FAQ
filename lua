1、可边长参数
lua 5.2之前变参被依次放在arg表中。可以通过...继续传递变参。
table.pack和table.unpack也可以操作arg以便继续传参。
lua5.2以后，需要通过 local arg = {...} 来获取变参。
