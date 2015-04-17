var WebdriverIO = require('webdriverio'),
    WebdriverCSS = require('webdrivercss'),
    fs = require('fs'),
    yaml = require('js-yaml');

var client = WebdriverIO.remote({
    desiredCapabilities: {
        browserName: 'phantomjs',
        'phantomjs.binary.path': '/opt/phantomjs/bin/phantomjs'
    }
});

var configTargets = yaml.safeLoad(fs.readFileSync('targets.yml', 'utf8'));
var project = configTargets['project'];
var baseUrl = configTargets['baseurl'];
var pages = configTargets['pages'];

WebdriverCSS.init(client, {
    screenshotRoot: project + '_regression_tests',
    misMatchTolerance: 0.09
});

client.init();
_gotoPage(0);

function _gotoPage(index) {
    var page = pages[index];
    if (typeof page === 'undefined') {
        return;
    }
    client.url( baseUrl + page['url'], function( err, res ) {
        client.title(function (err, res) {
            console.log( 'Processing page:',
                         index, '|',
                         'NAME:', page['data']['name'], '|',
                         'TITLE:', res.value, '|',
                         'URL:', page['url']
                        );
            client.webdrivercss( project, page['data'], function( err, res ) {
                console.log( 'Finished', page['data']['name'] );
                _gotoPage(++index);
            } );
        });

    } );
}

client.end();
