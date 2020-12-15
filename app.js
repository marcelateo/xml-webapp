var http= require('http'),
    path= require ('path'),
    express= require('express'),
    fs= require('fs'),
    xmlParse= require('xslt-processor').xmlParse,
    xsltProcess= require('xslt-processor').xsltProcess;
    xml2js = require('xml2js'); //This module does XML to JSON conversion and also allows us to get from JSON back to XML

var router = express(); //We set our routing to be handled by Express
var server = http.createServer(router); //This is where our server gets created

router.use(express.static(path.resolve(__dirname, 'views'))); //We define the views folder as the one where all static content will be served

// Function to read in XML file and convert it to JSON
function xmlFileToJs(filename, cb) {
  var filepath = path.normalize(path.join(__dirname, filename));
  fs.readFile(filepath, 'utf8', function(err, xmlStr) {
    if (err) throw (err);
    xml2js.parseString(xmlStr, {}, cb);
  });
}
//Function to convert JSON to XML and save it
function jsToXmlFile(filename, obj, cb) {
  var filepath = path.normalize(path.join(__dirname, filename));
  var builder = new xml2js.Builder();
  var xml = builder.buildObject(obj);
  fs.unlinkSync(filepath);
  fs.writeFile(filepath, xml, cb);
}
router.get('/', function(req, res) {
    res.render('index');
});

router.get('/get/html', function(req, res){

res.writeHead(200, {'Content-Type': 'text/html'});//found the page and provide message back to user

var xml= fs.readFileSync('WhereToGoNext.xml', 'utf8');//read each file xml and xsl
var xsl= fs.readFileSync('WhereToGoNext.xsl', 'utf8');

var doc= xmlParse(xml);
var stylesheet= xmlParse(xsl);

var result = xsltProcess(doc, stylesheet); //This does our XSL Transformation

res.end(result.toString()); //send the result back to the user
});

server.listen(process.env.PORT || 3000, process.env.IP ||"0.0.0.0", function(){
    var addr=server.address();
    console.log("Server Listening at", addr.address + ":"+ addr.port);
});