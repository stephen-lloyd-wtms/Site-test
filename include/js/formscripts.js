	
            var objPage = Page();
            function Page() {
            return(this);
            }
            objPage.idPage='1';

            function init()
            {
            SendEnable();
            }
					
            function validEmail(address) {
            var invalids = " /:,;";
		
            address = address.toLowerCase();
            var valids = "abcdefghijklmnopqrstuvwxyz0123456789@.-_";
		
            if (address == "")
            return false;
			
			
            for (i=0; i < address.length; i++) {
            testChar = address.charAt(i)
            if (valids.indexOf(testChar,0) == -1) {
								
            return false;
            }
            }
									
            atPos = address.indexOf("@",1)
            if (atPos == -1)
            return false;
									
            if (address.indexOf("@",atPos+1) != -1)
            return false;
									
            periodPos = address.indexOf(".",atPos)
            if (periodPos == -1)
            return false;
									
            if (periodPos+3 > address.length)
            return false;
		
		
		
            return true;
            }
					
            function SendEnable()
            {
            if (document.forms.form1.name.value=="")
            {
            document.forms.form1.Send.disabled=true;
            return(false);
            }
            if (!validEmail(document.forms.form1.email.value))
            {
            document.forms.form1.Send.disabled=true;
            return(false);
            }
            if ((document.forms.form1.SelOption.selectedIndex==-1) || (document.forms.form1.SelOption.selectedIndex==0))
            {
            document.forms.form1.Send.disabled=true;
            return(false);
            }
            document.forms.form1.Send.disabled=false;
						
            }