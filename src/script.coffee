styles = """
/*  
 * I ❤ JUEJIN
 * Authored by codeniu
 * 2023-04-25
 */

/*
 * ...呃
 *
 * 先来个酷酷的黑色背景吧
 *
 */

body {
    font-size: 14px;
    line-height: 1.4;
    background-color: #1a1c24;

    /* 字变成白色吧 */
    color: #fff;
}


pre {
    /* 创建一个放代码的地方吧 */
    position: fixed;
    width: 48%;
    top: 30px;
    bottom: 30px;
    left: 26%;
    transition: left 1000ms;
    overflow: auto;

    /* 加个颜色 */
    background-color: #313744;
    color: #a6c3d4;

    /* 加个边框 */

    border: 1px solid rgba(0, 0, 0, 0.2);
    padding: 24px 12px;
    box-sizing: border-box;

    /* 加个圆角 */

    border-radius: 3px;
    box-shadow: 0px 4px 0px 2px rgba(0, 0, 0, 0.1);
}

/*
 * ...呃
 *
 * 字有点小了吧
 *
 * 给我大
 *
 */

body {
    font-size: 24px;
    line-height: 1.4;
    -webkit-font-smoothing: subpixel-antialiased;
}

/* 
 * 看起来有点单调 
 * 来点颜色吧
 */

pre em:not(.comment) {
    font-style: normal;
}

.comment {
    color: #707e84;
}
.selector {
    color: #c66c75;
}
.selector .key {
    color: #c66c75;
}
.key {
    color: #c7ccd4;
}
.value {
    color: #d5927b;
}

/* 先把这些碍眼的代码扔到左边 */

pre {
    left: 50%;
}

/* 现在顺眼多了 */

/* 写个I字 */ 

#chari::before{
    content: "I";
    font-size: 68px;
    font-weight: bold;
    /* 掏空 */
    -webkit-text-stroke: 1px #1e80ff;
    -webkit-text-fill-color: transparent;
}

#chari { 
    position: fixed;
    top: calc(50% - 150px); 
    left: 5%
}

/* ♥♥ */
#heart::before{
    content: "❤";
    font-size: 68px;
    font-weight: bold;
    /* bling bling */
    text-shadow: 0 0 10px red,0 0 20px red,0 0 30px red,0 0 40px red;
}

#heart { 
    position: fixed;
    top: calc(50% - 150px); 
    left: 7%
}


/* 写下JUEJIN */
#juejin::before{
    content: 'JUEJIN';
    position: absolute;
    font-style: normal;
    font-weight: 900;
    font-size: 68px;
    text-shadow: -1px -1px 0px rgba(30, 128, 255,0.2);
}

#juejin { 
    position: fixed;
    top: calc(50% - 150px); 
    left: 12%;
}

/* 自己动  */
@-webkit-keyframes heartbeat {
  0%, 100% { 
    -webkit-transform: scale(0.95); 
            transform: scale(0.95); 
  }
  50% { 
    -webkit-transform: scale(1.00); 
            transform: scale(1.00); 
  }
}

@keyframes heartbeat {
  0%, 100% { transform: scale(0.95); }
  50%      { transform: scale(1.00); }
}


#heart {
    -webkit-animation-duration: 2000ms;
            animation-duration: 2000ms;
    -webkit-animation-timing-function: 
    cubic-bezier(0, 0, 0, 1.74);
            animation-timing-function: 
            cubic-bezier(0, 0, 0, 1.74);
    -webkit-animation-delay: 500ms;
            animation-delay: 500ms;
    -webkit-animation-iteration-count: infinite;
            animation-iteration-count: infinite;
    -webkit-animation-play-state: paused;
            animation-play-state: paused;
}
/* 你相信光吗 */
@-webkit-keyframes Glow {
    from {
        text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff,
        0 0 40px #00a67c, 0 0 70px #00a67c, 0 0 80px #00a67c,
        0 0 100px #00a67c, 0 0 150px #00a67c;
    }
    to {
        text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff,
        0 0 20px #00a67c, 0 0 35px #00a67c, 0 0 40px #00a67c,
        0 0 50px #00a67c, 0 0 75px #00a67c;
    }
}
@keyframes Glow {
    from {
        text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff,
        0 0 40px #00a67c, 0 0 70px #00a67c, 0 0 80px #00a67c,
        0 0 100px #00a67c, 0 0 150px #00a67c;
    }
    to {
        text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff,
        0 0 20px #00a67c, 0 0 35px #00a67c, 0 0 40px #00a67c,
        0 0 50px #00a67c, 0 0 75px #00a67c;
    }
}

#heart { 
    -webkit-animation-name: heartbeat; 
          animation-name: heartbeat; 
}

#heart {
  -webkit-animation-play-state: running;
          animation-play-state: running;  
}

/* bling bling */
#chari,#juejin:hover{
	-webkit-animation: Glow 0.5s ease infinite alternate;
    animation: Glow 0.5s ease infinite alternate;
}


"""

openComment = false

writeStyleChar = (which) ->
	# begin wrapping open comments
  if which == '/' && openComment == false
    openComment = true
    styles = $('#style-text').html() + which
  else if which == '/' && openComment == true
    openComment = false
    styles = $('#style-text').html().replace(/(\/[^\/]*\*)$/, '<em class="comment">$1/</em>')
  # wrap style declaration
  else if which == ':'
    styles = $('#style-text').html().replace(/([a-zA-Z- ^\n]*)$/, '<em class="key">$1</em>:')
  # wrap style value 
  else if which == ';'
    styles = $('#style-text').html().replace(/([^:]*)$/, '<em class="value">$1</em>;')
  # wrap selector
  else if which == '{'
    styles = $('#style-text').html().replace(/(.*)$/, '<em class="selector">$1</em>{')
  else
    styles = $('#style-text').html() + which
  $('#style-text').html styles
  $('#style-tag').append which

writeStyles = (message, index, interval) ->
  if index < message.length
    pre = document.getElementById 'style-text'
    pre.scrollTop = pre.scrollHeight
    writeStyleChar message[index++]
    setTimeout (->
      writeStyles message, index, interval
    ), interval
    

# 添加需要的标签
$('body').append """
    <style id="style-tag"></style>
    <span id="chari"></span>
	<span id="heart"><i></i></span>
    <span id="juejin"></span>
	<pre id="style-text"></pre>
"""

time = if window.innerWidth <= 578 then 10 else 20
  
writeStyles(styles, 0, time)
