function! Download()
python << EOF
import urllib
import urllib2
url = 'http://test.je4.cn/open/get_content/97'
#data = urllib.urlencode(values)
req = urllib2.Request(url)
response = urllib2.urlopen(req)
the_page = response.read()
fp = open("/home/jishuai/97.txt",'w')
fp.write(the_page)
fp.close()
EOF
endfunction

function! Upload()
python << EOF
import urllib
import urllib2
url = 'http://test.je4.cn/open/set_content/97'
fp = open("/home/jishuai/97.txt",'r')
content = fp.read()
fp.close()
values={'content':content}
data = urllib.urlencode(values)
req = urllib2.Request(url,data)
response = urllib2.urlopen(req)
the_page = response.read()
print the_page
EOF
endfunction

comm! BlogDown call Download()
comm! BlogUp call Upload()
