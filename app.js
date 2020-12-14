var http= require('http'),
    path= require ('path'),
    express= require('express'),
    fs= require('fs'),
    xmlParse= require('xslt-processor').xmlParse,
    xsltProcess= require('xslt-processor').xsltProcess;

var router= express();
var server= http.createServer(router);// where the server is created

router.use(express.static(path.resolve(_dirname, 'views')));

router.get('/', function(req, res){

res.writeHead(200, {'Content-Type': 'text/html'});//found the page and provide message back to user

var xml= fs.readFileSync('WhereToGoNext.xml', 'utf8');//read each file xml and xsl
var xsl= fs.readFileSync('WhereToGoNext.xsl', 'utf8');

var doc= xmlParse(xml);
var stylesheet= xmlParse(sxl);

var result= xsltProcess(doc, stysheet); // it does the xsl transformation

res.end(result.toString()); //send the result back to the user
});

server.listen(process.env.PORT || 3000, process.env.IP ||"0.0.0.0", function(){
    var addr=server.address();
    console.log("Server Listening at", addr.address + "+" + addr.port);
});
