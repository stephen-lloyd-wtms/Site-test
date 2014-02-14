<%
function isAlpha(str)
	Dim objRegExp
	Set objRegExp = New RegExp
	objRegExp.Pattern = "[^-'&._ÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞ‗אגדהוזחטיךכלםמןנסעףפץצרשתûü‎‏ÿ, a-zA-Z]"
	isAlpha=Not objRegExp.Test(str)
end function

function isOnlyNumbers(str)
	Dim objRegExp
	Set objRegExp = New RegExp
	objRegExp.Pattern = "[^-+ 0-9]"
	isOnlyNumbers=not objRegExp.Test(str)
end function

function isAlphaNumeric(str)
	Dim objRegExp
	Set objRegExp = New RegExp
	objRegExp.Pattern = "[^-+ 0-9-'&._ÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞ‗אגדהוזחטיךכלםמןנסעףפץצרשתûü‎‏ÿ, a-zA-Z()]"
	isAlphaNumeric=not objRegExp.Test(str)
end function

function isPhoneNumber(str)
	Dim objRegExp
	Set objRegExp = New RegExp
	objRegExp.Pattern = "[^-+ 0-9()]"
	isPhoneNumber=not objRegExp.Test(str)
end function


function validEmail(str)
	Dim objRegExp
	Set objRegExp = New RegExp
	objRegExp.Pattern = "^[\w\.-]+@[\w\.-]+\.[a-zA-Z]+$" '"\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*"
	validEmail = objRegExp.Test(str)
end function


'ÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞ‗אגדהוזחטיךכלםמןנסעףפץצרשתûü‎‏ÿ

%>