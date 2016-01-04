var TYPE_REPLACE_ALL = "1"; 
var TYPE_REPLACE_SELECTED = "2";
var TYPE_APPEND_ALL = "3"
var TYPE_APPEND_SELECTED = "4" 

var chromeApp = null; 

var clearChromeText = function () {
  var win = chromeApp.windows[0];
  var tab = win.activeTab();
  tab.selectAll(); 
  tab.cutSelection();
  delay(0.3); 
}; 

var getTextFromVim = function () {
  var currentApp = Application.currentApplication(); 
  currentApp.includeStandardAdditions = true; 

  var textFromVim = currentApp.doShellScript('cat $HOME/.vim2browser/share.txt');
  var textFromVimArray = textFromVim.split(/\r\n|\r|\n/);
  var retText = '';
  for (var i = 0; i < textFromVimArray.length; i++) {
    retText += textFromVimArray[i] + '\n';
  } 
  return retText;
};

var saveTextInClipboard = function (text) { 
  chromeApp.setTheClipboardTo(text); 
};


var pasteToChrome = function (vimAppName) {
  var vimApp = null;
  try { 
    vimApp = Application(vimAppName); 
  } catch(e) { 
    console.log(e); 
    return;
  } 

  var systemEvemts = Application("System Events"); 
  chromeApp.activate();
  delay(0.3);

  // TODO: keycode other petern
  systemEvemts.keystroke("v",{ using:["command down", "shift down"]}); 
  vimApp.activate(); 


  // 書式ありver 
  //var win = chromeApp.windows[0];
  //var tab = win.activeTab(); 
  //tab.selectAll();
  //tab.pasteSelection(); 
}; 


// argv[0] type
// argv[1] VimAppName 
function run(argv){ 
  if (argv.length < 2) {
    console.log("Arguments are necessary more than two.");
    return; 
  } 
  
  try { 
    chromeApp = Application('Google Chrome'); 
    chromeApp.includeStandardAdditions = true; 
  } catch(e) {
    console.log(e); 
    return; 
  }

  if (argv[0] === TYPE_REPLACE_SELECTED || argv[0] === TYPE_REPLACE_ALL) {
    clearChromeText(); 
  } 

  saveTextInClipboard(getTextFromVim()); 
  // argv[1]はVimAppName
  pasteToChrome(argv[1]);
} 


