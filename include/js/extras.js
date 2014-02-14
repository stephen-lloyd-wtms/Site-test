//<script>
function validEmail(address) {
		address = address.toLowerCase();
		valids = "abcdefghijklmnopqrstuvwxyz0123456789@.-_";
		
		for (i=0; i < address.length; i++) 
		{
			testChar = address.charAt(i);
			if (valids.indexOf(testChar,0) == -1) {
				return false;
			}
		}
							
		atPos = address.indexOf("@",1);
		if (atPos == -1)
			return false;
						
		if (address.indexOf("@",atPos+1) != -1)
			return false;
						
		periodPos = address.indexOf(".",atPos);
		if (periodPos == -1)
			return false;
						
		if (periodPos+3 > address.length)
			return false;
		
		if (address.charAt(address.length-1)=='.')	
			return false;
		
		return(true);
	}
	
	//function rollover(imgid,imgsrc)
	//{
	//	document.images[imgid].src=imgsrc;	
	//}
	
	function emptyField(obj,str)
	{
		if(obj.value == str)
		{
			obj.value = "";
		}
	}
		function rollover(imgid,imgsrc)
	{
		eval("document.images['"+imgid+"'].src='"+imgsrc+"'")
	}
	
	
	function preload()
		{
				//Top Navigation QF pages
				img_01 = new Image()
				img_01.src="../files/images/menu_education.gif"
				img_02 = new Image()
				img_02.src="../files/images/menu_education_on.gif"
				img_03 = new Image()
				img_03.src="../files/images/menu_community.gif"
				img_04 = new Image()
				img_04.src="../files/images/menu_community_on.gif"
				img_05 = new Image()
				img_05.src="../files/images/menu_science.gif"
				img_06 = new Image()
				img_06.src="../files/images/menu_science_on.gif"
				img_07 = new Image()
				img_07.src="../files/images/QF_navbar-master_open_01.gif"
				img_08 = new Image()
				img_08.src="../files/images/menu_button.gif"
				img_09 = new Image()
				img_09.src="../files/images/menu_arabic.gif"
				img_10 = new Image()
				img_10.src="../files/images/menu_arrow_off.gif"
				img_11 = new Image()
				img_11.src="../files/images/menu_arrowOn.gif"
				img_12 = new Image()
				img_12.src="../files/images/ch_menu_arrow.gif"
				img_13 = new Image()
				img_13.src="../files/images/ch_menu_arrowon.gif"
				img_14 = new Image()
				img_14.src="../files/images/ed_menu_arrow.gif"
				img_15 = new Image()
				img_15.src="../files/images/ed_menu_arrowon.gif"
				img_16 = new Image()
				img_16.src="../files/images/sr_menu_arrow.gif"
				img_17 = new Image()
				img_17.src="../files/images/sr_menu_arrowon.gif"
				img_18 = new Image()
				img_18.src="../files/images/submenu_arrowOff.gif"
				img_19 = new Image()
				img_19.src="../files/images/submenu_arrowOn.gif"
				
				
				//Center left navigation top level
				img_20 = new Image()
				img_20.src="../files/images/qa_menuArrow_off.gif"
				img_21 = new Image()
				img_21.src="../files/images/qa_menuArrow_on.gif"
				img_22 = new Image()
				img_22.src="../files/images/qda_menuArrow_on.gif"
				img_23 = new Image()
				img_23.src="../files/images/sdc_menuArrow_on.gif"
				img_24 = new Image()
				img_24.src="../files/images/tlc_menuArrow_on.gif"
				img_25 = new Image()
				img_25.src="../files/images/stp_menuArrow_on.gif"
				
				//Center Left navigation sub level
				img_26 = new Image()
				img_26.src="../files/images/shared_arrow.gif"
				img_27 = new Image()
				img_27.src="../files/images/abp_arrow_on.gif"
				img_28 = new Image()
				img_28.src="../files/images/qa_arrow_on.gif"
				img_29 = new Image()
				img_29.src="../files/images/qda_arrow_on.gif"
				img_30 = new Image()
				img_30.src="../files/images/sdc_arrow_on.gif"
				img_31 = new Image()
				img_31.src="../files/images/stp_arrow_on.gif"
				img_32 = new Image()
				img_32.src="../files/images/tlc_arrow_on.gif"
				
				//Center Left navigation sub level 2
				img_33 = new Image()
				img_33.src="../files/images/bullet_offState.gif"
				img_34 = new Image()
				img_34.src="../files/images/abp_bullet_list.gif"
				img_35 = new Image()
				img_35.src="../files/images/qa_bullet_list.gif"
				img_36 = new Image()
				img_36.src="../files/images/qda_bullet_list.gif"
				img_37 = new Image()
				img_37.src="../files/images/qf_bullet_list.gif"
				img_38 = new Image()
				img_38.src="../files/images/sdc_bullet_list.gif"
				img_39 = new Image()
				img_39.src="../files/images/stp_bullet_list.gif"
				img_40 = new Image()
				img_40.src="../files/images/tlc_bullet_list.gif"
				img_41 = new Image()
				img_41.src="../files/images/bullet_StateQFMap.gif"
				
				
				//Bookmark arrows
				img_42 = new Image()
				img_42.src="../files/images/qa_arrowUp.gif"
				img_43 = new Image()
				img_43.src="../files/images/qa_downArrow.gif"

				//Background images for the top and bottom navigation
				img_44 = new Image()
				img_44.src="/files/images/menu_tile.gif"
				img_45 = new Image()
				img_45.src="/files/images/zigzag_tile.gif"
							
		}

	function init()
		{
			preload();
		}
	

//</script>