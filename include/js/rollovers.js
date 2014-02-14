
            function rollover(imgid,imgsrc)
            {
            eval("document.images['"+imgid+"'].src='"+imgsrc+"'")
            }
            
            var imgArray = new Array ('/files/images/xm_home_nav3_on.gif','/files/images/xm_home_nav2_on.gif','/files/images/xm_home_nav1.gif');
            for (var i=0;i<imgArray.length;i++) {
            var pImg = new Image();
            pImg.src=imgArray[i];
            }
