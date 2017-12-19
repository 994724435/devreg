CKEDITOR.editorConfig = function( config )
{
	config.language = "zh-cn";
	config.uiColor = '#DCDCDC';
	config.font_defaultLabel = 'Gulim';
	config.font_names = 'Gulim/Gulim;Dotum/Dotum;Batang/Batang;Gungsuh/Gungsuh;Arial/Arial;Tahoma/Tahoma;Verdana/Verdana';
	config.fontSize_defaultLabel = '12px';
	config.fontSize_sizes = '8/8px;9/9px;10/10px;11/11px;12/12px;14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;26/26px;28/28px;36/36px;48/48px;';
	config.resize_enabled = false;
    config.enterMode = CKEDITOR.ENTER_BR;
    config.shiftEnterMode = CKEDITOR.ENTER_P;
	config.startupFocus = false;
	config.toolbarCanCollapse = false;
	config.menu_subMenuDelay = 0;
    config.htmlEncodeOutput = false;
	config.ForcePasteAsPlainText = false ;
	config.AutoDetectPasteFromWord = true ; 
//	config.removePlugins = 'liststyle';
//	config.removePlugins = 'contextmenu'; 
//	config.removeMenuItem = 'paste'
	config.allowedContent= true,
	config.pasteFromWordRemoveFontStyles = true,
	config.pasteFromWordRemoveStyles = true
	config.pasteFromWordRemoveFontStyles = true;
    config.pasteFromWordRemoveStyles = true;

	config.extraPlugins = 'wordcount';
	config.wordcount = {
	 // Whether or not you want to show the Word Count
	 showWordCount: false,
	 wordLimit: 10,
	 // Whether or not you want to show the Char Count
	 showCharCount: true,
	 countHTML: false
	};


    config.toolbar = 'User';
	config.toolbar_User = [
		['Bold','Italic','OrderedList','UnorderedList','-','SpecialChar','Subscript','Superscript']
	] ;        

 
	config.keystrokes =
	[

	[ CKEDITOR.CTRL + 90 /*Z*/, 'undo' ],
	[ CKEDITOR.CTRL + 89 /*Y*/, 'redo' ],
	[ CKEDITOR.CTRL + CKEDITOR.SHIFT + 90 /*Z*/, 'redo' ],
//	[ CKEDITOR.CTRL + 86 /*V*/, 'pastefromword' ],
	[ CKEDITOR.SHIFT + 45 /*INS*/, 'pastefromword' ]

	];

};