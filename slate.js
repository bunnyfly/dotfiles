/**
 * Config!
 */

slate.configAll({
  modalEscapeKey: 'esc',
  // Also show hints in bottom-right corner of windows.
  windowHintsTopLeftX: '(windowSizeX/2)-(windowHintsWidth/2);32;windowSizeX-windowHintsWidth-32',
  windowHintsTopLeftY: '(windowSizeY/2)-(windowHintsHeight/2);32;windowSizeY-windowHintsHeight-32',
  orderScreensLeftToRight: true,
});


/**
 * Helpers!
 */

var isClose = function(a, b) {
  return Math.abs(a - b) < 32;
}

var isCloseRect = function(rect0, rect1) {
  return (
      isClose(rect0.x, rect1.x) &&
      isClose(rect0.y, rect1.y) &&
      isClose(rect0.width, rect1.width) &&
      isClose(rect0.height, rect1.height));
}

/** Layout windows! 
slate.bind('l:alt', function(win) {
  var winRect = win.rect();
  var screenRect = win.screen().visibleRect();
  if (isCloseRect(winRect, {x: screenRect.x + screenRect.width / 2, y: screenRect.y, width: screenRect.width / 2, height: screenRect.height})) {
    win.doOperation(slate.operation('push', {direction: 'right', style: 'bar-resize:screenSizeX/3'}));
  } else if (isCloseRect(winRect, {x: screenRect.x + 2 * screenRect.width / 3, y: screenRect.y, width: screenRect.width / 3, height: screenRect.height})) {
    win.doOperation(slate.operation('push', {direction: 'right', style: 'bar-resize:2*screenSizeX/3'}));
  } else {
    win.doOperation(slate.operation('push', {direction: 'right', style: 'bar-resize:screenSizeX/2'}));
  }
});
*/


/**
 * Push bindings!
 *
 * Pushing cycles windows between half, one-third, and two-thirds screen height/width.
 */

/** Push left! */
slate.bind('h:alt', function(win) {
  var winRect = win.rect();
  var screenRect = win.screen().visibleRect();
  if (isCloseRect(winRect, {x: screenRect.x, y: screenRect.y, width: screenRect.width / 2, height: screenRect.height})) {
    win.doOperation(slate.operation('push', {direction: 'left', style: 'bar-resize:screenSizeX/3'}));
  } else if (isCloseRect(winRect, {x: screenRect.x, y: screenRect.y, width: screenRect.width / 3, height: screenRect.height})) {
    win.doOperation(slate.operation('push', {direction: 'left', style: 'bar-resize:2*screenSizeX/3'}));
  } else {
    win.doOperation(slate.operation('push', {direction: 'left', style: 'bar-resize:screenSizeX/2'}));
  }
});

/** Push right! */
slate.bind('i:alt', function(win) {
  var winRect = win.rect();
  var screenRect = win.screen().visibleRect();
  if (isCloseRect(winRect, {x: screenRect.x + screenRect.width / 2, y: screenRect.y, width: screenRect.width / 2, height: screenRect.height})) {
    win.doOperation(slate.operation('push', {direction: 'right', style: 'bar-resize:screenSizeX/3'}));
  } else if (isCloseRect(winRect, {x: screenRect.x + 2 * screenRect.width / 3, y: screenRect.y, width: screenRect.width / 3, height: screenRect.height})) {
    win.doOperation(slate.operation('push', {direction: 'right', style: 'bar-resize:2*screenSizeX/3'}));
  } else {
    win.doOperation(slate.operation('push', {direction: 'right', style: 'bar-resize:screenSizeX/2'}));
  }
});

/** Push up! */
slate.bind('e:alt', function(win) {
  var winRect = win.rect();
  var screenRect = win.screen().visibleRect();
  if (isCloseRect(winRect, {x: screenRect.x, y: screenRect.y, width: screenRect.width, height: screenRect.height / 2})) {
    win.doOperation(slate.operation('push', {direction: 'up', style: 'bar-resize:screenSizeY/3'}));
  } else if (isCloseRect(winRect, {x: screenRect.x, y: screenRect.y, width: screenRect.width, height: screenRect.height / 3})) {
    win.doOperation(slate.operation('push', {direction: 'up', style: 'bar-resize:2*screenSizeY/3'}));
  } else {
    win.doOperation(slate.operation('push', {direction: 'up', style: 'bar-resize:screenSizeY/2'}));
  }
});

/** Push down! */
slate.bind('n:alt', function(win) {
  var winRect = win.rect();
  var screenRect = win.screen().visibleRect();
  if (isCloseRect(winRect, {x: screenRect.x, y: screenRect.y + screenRect.height / 2, width: screenRect.width, height: screenRect.height / 2})) {
    win.doOperation(slate.operation('push', {direction: 'down', style: 'bar-resize:screenSizeY/3'}));
  } else if (isCloseRect(winRect, {x: screenRect.x, y: screenRect.y + 2 * screenRect.height / 3, width: screenRect.width, height: screenRect.height / 3})) {
    win.doOperation(slate.operation('push', {direction: 'down', style: 'bar-resize:2*screenSizeY/3'}));
  } else {
    win.doOperation(slate.operation('push', {direction: 'down', style: 'bar-resize:screenSizeY/2'}));
  }
});

/** Push left, preserving height! */
slate.bind('h:alt,shift', function(win) {
  var winRect = win.rect();
  var screenRect = win.screen().visibleRect();
  if (isCloseRect(winRect, {x: screenRect.x, y: winRect.y, width: screenRect.width / 2, height: winRect.height})) {
    win.doOperation(slate.operation('move', {x: screenRect.x, y: winRect.y, width: screenRect.width / 3, height: winRect.height}));
  } else if (isCloseRect(winRect, {x: screenRect.x, y: winRect.y, width: screenRect.width / 3, height: winRect.height})) {
    win.doOperation(slate.operation('move', {x: screenRect.x, y: winRect.y, width: 2 * screenRect.width / 3, height: winRect.height}));
  } else {
    win.doOperation(slate.operation('move', {x: screenRect.x, y: winRect.y, width: screenRect.width / 2, height: winRect.height}));
  }
});

/** Push right, preserving height! */
slate.bind('i:alt,shift', function(win) {
  var winRect = win.rect();
  var screenRect = win.screen().visibleRect();
  if (isCloseRect(winRect, {x: screenRect.x + screenRect.width / 2, y: winRect.y, width: screenRect.width / 2, height: winRect.height})) {
    win.doOperation(slate.operation('move', {x: screenRect.x + 2 * screenRect.width / 3, y: winRect.y, width: screenRect.width / 3, height: winRect.height}));
  } else if (isCloseRect(winRect, {x: screenRect.x + 2 * screenRect.width / 3, y: winRect.y, width: screenRect.width / 3, height: winRect.height})) {
    win.doOperation(slate.operation('move', {x: screenRect.x + screenRect.width / 3, y: winRect.y, width: 2 * screenRect.width / 3, height: winRect.height}));
  } else {
    win.doOperation(slate.operation('move', {x: screenRect.x + screenRect.width / 2, y: winRect.y, width: screenRect.width / 2, height: winRect.height}));
  }
});

/** Push up, preserving width! */
slate.bind('e:alt,shift', function(win) {
  var winRect = win.rect();
  var screenRect = win.screen().visibleRect();
  if (isCloseRect(winRect, {x: winRect.x, y: screenRect.y, width: winRect.width, height: screenRect.height / 2})) {
    win.doOperation(slate.operation('move', {x: winRect.x, y: screenRect.y, width: winRect.width, height: screenRect.y + screenRect.height / 3}));
  } else if (isCloseRect(winRect, {x: winRect.x, y: screenRect.y, width: winRect.width, height: screenRect.height / 3})) {
    win.doOperation(slate.operation('move', {x: winRect.x, y: screenRect.y, width: winRect.width, height: screenRect.y + 2 * screenRect.height / 3}));
  } else {
    win.doOperation(slate.operation('move', {x: winRect.x, y: screenRect.y, width: winRect.width, height: screenRect.y + screenRect.height / 2}));
  }
});

/** Push down, preserving width! */
slate.bind('n:alt,shift', function(win) {
  var winRect = win.rect();
  var screenRect = win.screen().visibleRect();
  if (isCloseRect(winRect, {x: winRect.x, y: screenRect.y + screenRect.height / 2, width: winRect.width, height: screenRect.height / 2})) {
    win.doOperation(slate.operation('move', {x: winRect.x, y: screenRect.y + 2 * screenRect.height / 3, width: winRect.width, height: screenRect.y + screenRect.height / 3}));
  } else if (isCloseRect(winRect, {x: winRect.x, y: screenRect.y + 2 * screenRect.height / 3, width: winRect.width, height: screenRect.height / 3})) {
    win.doOperation(slate.operation('move', {x: winRect.x, y: screenRect.y + screenRect.height / 3, width: winRect.width, height: screenRect.y + 2 * screenRect.height / 3}));
  } else {
    win.doOperation(slate.operation('move', {x: winRect.x, y: screenRect.y + screenRect.height / 2, width: winRect.width, height: screenRect.y + screenRect.height / 2}));
  }
});

/** Fullscreen! */
slate.bind('m:alt', function(win) {
  win.doOperation(slate.operation('move', {'x' : 'screenOriginX', 'y' : 'screenOriginY', 'width' : 'screenSizeX', 'height' : 'screenSizeY'}));
});

/** Throw to next screen! */
slate.bind('h:alt,ctrl', function(win) {
  win.doOperation(slate.operation('throw', {screen: 'next'}));
});

/** Throw to previous screen! */
slate.bind('i:alt,ctrl', function(win) {
  win.doOperation(slate.operation('throw', {screen: 'prev'}));
});

/** Select window! Cmd-Alt-Tab. */
slate.bind('tab:cmd,alt', function(win) {
  win.doOperation(
      slate.operation('hint', {
        characters: 'HNEIOLUYARSTDPFW'
      }));
});
