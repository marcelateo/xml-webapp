// code by Mikhail to be able to create router, functions to read and convert files. also code for the server
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
router.use(express.urlencoded({extended: true})); //We allow the data sent from the client to be coming in as part of the URL in GET and POST requests
router.use(express.json()); //We include support for JSON that is coming from the client

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
router.post('/post/json', function (req, res) {

    function appendJSON(obj) {

        console.log(obj)

        xmlFileToJs('WhereToGoNext.xml', function (err, result) {
            if (err) throw (err);
            
            result.mainplaces.section[obj.sec_n].place.push({'item': obj.item, 'price': obj.price});

            console.log(JSON.stringify(result, null, "  "));

            jsToXmlFile('WhereToGoNext.xml', result, function(err){
                if (err) console.log(err);
            });
        });
    };

    appendJSON(req.body);

    res.redirect('back');

});
router.post('/post/delete', function (req, res) {

    function deleteJSON(obj) {

        console.log(obj)

        xmlFileToJs('WhereToGoNext.xml', function (err, result) {
            if (err) throw (err);
            
            delete result.mainplaces.section[obj.section].place[obj.place];

            console.log(JSON.stringify(result, null, "  "));

            jsToXmlFile('WhereToGoNext.xml', result, function(err){
                if (err) console.log(err);
            });
        });
    };

    deleteJSON(req.body);

    res.redirect('back');

});

server.listen(process.env.PORT || 3000, process.env.IP ||"0.0.0.0", function(){
    var addr=server.address();
    console.log("Server Listening at", addr.address + ":"+ addr.port);
});