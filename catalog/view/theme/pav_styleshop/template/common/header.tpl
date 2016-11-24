<?php 
/******************************************************
 * @package Pav Opencart Theme Framework for Opencart 1.5.x
 * @version 1.1
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Augus 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/


$themeConfig = $this->config->get( 'themecontrol' );
$LANGUAGE_ID = $this->config->get( 'config_language_id' ); 
$themeName =  $this->config->get('config_template');
require_once( DIR_TEMPLATE.$this->config->get('config_template')."/development/libs/framework.php" );
$helper = ThemeControlHelper::getInstance( $this->registry, $themeName );
$helper->setDirection( $direction );
/* Add scripts files */
$helper->addScript( 'catalog/view/javascript/jquery/jquery-1.7.1.min.js' );
$helper->addScript( 'catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js' );
$helper->addScript( 'catalog/view/javascript/jquery/ui/external/jquery.cookie.js' );
$helper->addScript( 'catalog/view/javascript/common.js' );
$helper->addScript( 'catalog/view/theme/'.$themeName.'/javascript/common.js' );
$helper->addScript( 'catalog/view/javascript/jquery/bootstrap/bootstrap.min.js' );
$helper->addScriptList( $scripts );

$helper->addCss( 'catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css' );	
if( isset($themeConfig['customize_theme']) 
	&& file_exists(DIR_TEMPLATE.$themeName.'/stylesheet/customize/'.$themeConfig['customize_theme'].'.css') ) {  
	$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/customize/'.$themeConfig['customize_theme'].'.css'  );
}

	$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/animation.css' );	
	$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/font-awesome.min.css' );	
	$helper->addCssList( $styles );
	$layoutMode = $helper->getParam( 'layout' );
 	$logoType =isset($themeConfig['logo_type'])?$themeConfig['logo_type']:"logo-theme";

 	//call by framework Auto Search
 	$configsearch = $this->config->get('pavautosearch_module');
  	$autosearch = empty($configsearch)?'':$helper->renderModule( 'module/pavautosearch' );
?>
<!DOCTYPE html>
<html dir="<?php echo $helper->getDirection(); ?>" class="<?php echo $helper->getDirection(); ?>" lang="<?php echo $lang; ?>">
<head>
<meta name="google-site-verification" content="GzsJvPlBGkSOExPZYbT9WDHODTp-TSaAcMj6sQ8BzPI" />
<meta name="google-site-verification" content="ISTTCJRU5PYASaFm0KItlkbrfPFmaAlRd8DrCYAP5Xw" />
<meta name="yandex-verification" content="a3c939a14efa7f75" />


<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
<!-- Mobile viewport optimized: h5bp.com/viewport -->
<meta name="viewport" content="width=device-width">
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />

<meta name="Keywords" content="<?php echo $keywords; ?>">

<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>

<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($helper->getCssLinks() as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

	<?php if( $themeConfig['theme_width'] &&  $themeConfig['theme_width'] != 'auto' ) { ?>
			<style> #page-container .container{max-width:<?php echo $themeConfig['theme_width'];?>; width:auto}</style>
	<?php } ?>
	
	<?php if( isset($themeConfig['use_custombg']) && $themeConfig['use_custombg'] ) {	?>
	<style> 
		body{
			background:url( "image/<?php echo $themeConfig['bg_image'];?>") <?php echo $themeConfig['bg_repeat'];?>  <?php echo $themeConfig['bg_position'];?> !important;
		}</style>
	<?php } ?>
<?php 
	if( isset($themeConfig['enable_customfont']) && $themeConfig['enable_customfont'] ){
	$css=array();
	$link = array();
	for( $i=1; $i<=3; $i++ ){
		if( trim($themeConfig['google_url'.$i]) && $themeConfig['type_fonts'.$i] == 'google' ){
			$link[] = '<link rel="stylesheet" type="text/css" href="'.trim($themeConfig['google_url'.$i]) .'"/>';
			$themeConfig['normal_fonts'.$i] = $themeConfig['google_family'.$i];
		}
		if( trim($themeConfig['body_selector'.$i]) && trim($themeConfig['normal_fonts'.$i]) ){
			$css[]= trim($themeConfig['body_selector'.$i])." {font-family:".str_replace("'",'"',htmlspecialchars_decode(trim($themeConfig['normal_fonts'.$i])))."}\r\n"	;
		}
	}
	echo implode( "\r\n",$link );
?>
<style>
	<?php echo implode("\r\n",$css);?>
</style>
<?php } else { ?>
	<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,200,400italic,700,600,300italic,600italic,700italic,900,900italic' rel='stylesheet' type='text/css'>
<?php } ?>
<?php foreach( $helper->getScriptFiles() as $script )  { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>


<?php if( isset($themeConfig['custom_javascript'])  && !empty($themeConfig['custom_javascript']) ){ ?>
	<script type="text/javascript"><!--
		$(document).ready(function() {
			<?php echo html_entity_decode(trim( $themeConfig['custom_javascript']) ); ?>
		});
//--></script>
<?php }	?>



<!--[if lt IE 9]>
<?php if( isset($themeConfig['load_live_html5'])  && $themeConfig['load_live_html5'] ) { ?>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<?php } else { ?>
<script src="catalog/view/javascript/html5.js"></script>
<?php } ?>
<script src="catalog/view/javascript/respond.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $themeName;?>/stylesheet/ie8.css" />
<![endif]-->
<?php if( isset($themeConfig['enable_paneltool']) && $themeConfig['enable_paneltool'] ){  ?>
<link  href="catalog/view/theme/<?php echo $themeName;?>/stylesheet/paneltool.css" rel="stylesheet"/>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorpicker/js/colorpicker.js"></script>
<link href="catalog/view/javascript/jquery/colorpicker/css/colorpicker.css" rel="stylesheet" />
<?php } ?>

<?php if ( isset($stores) && $stores ) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>

<?php echo $google_analytics; ?>
</head>
<body id="offcanvas-container" class="offcanvas-container layout-<?php echo $layoutMode; ?> fs<?php echo $themeConfig['fontsize'];?> <?php echo $helper->getPageClass();?> <?php echo $helper->getParam('body_pattern','');?>">
	<section id="page" class="offcanvas-pusher" role="main">
		<header id="header">
			<div id="topbar">
				<div class="container">	
					<div class="show-desktop">
						<div class="quick-top-link">
							<!-- Single button -->
							<div class="language btn-top pull-left">
								<?php echo $language; ?>
							</div>
							<div class="currency btn-top pull-left">
								 <?php echo $currency; ?>
							</div>	
							<div class="quick-access btn-group btn-top pull-left">
								<button type="button" class="form-control" data-toggle="dropdown">
									<span class="quick-icon">
										<?php echo $text_account; ?>
										<span class="fa fa-sort-asc"></span>
									</span>	
								</button>													
									<div class="dropdown-menu">
										<ul class="links">
											<li><a class="wishlist" href="<?php echo $wishlist; ?>"><span class="fa fa-heart"></span><?php echo $text_wishlist; ?></a></li>
											<li><a class="account" href="<?php echo $account; ?>"><span class="fa fa-user"></span><?php echo $text_account; ?></a></li>
											<li><a class="shoppingcart" href="<?php echo $shopping_cart; ?>"><span class="fa fa-shopping-cart"></span><?php echo $text_shopping_cart; ?></a></li>
											<li><a class="last checkout" href="<?php echo $checkout; ?>"><span class="fa fa-file"></span><?php echo $text_checkout; ?></a></li> 					
										</ul>
									</div>					
							</div>
							<div class="welcome pull-right hidden-sm hidden-xs">
								<?php if (!$logged) { ?>
								<?php echo $text_welcome; ?>
								<?php } else { ?>
								<?php echo $text_logged; ?>
								<?php } ?> 
							</div>	
<!--

                            <div id="search">					
                                <div class="input-group">
                                <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" class="input-search form-control" />
                                <span class="input-group-btn">							
                                    <button class="button-search" type="button"><em class="fa fa-search"></em></button>
                                </span>
                                </div>								
                            </div>
-->

						</div>
					</div>	

					

				<div class="show-mobile hidden-lg hidden-md">
				
					<div class="btn-top quick-user pull-left">
						<div class="form-control quickaccess-toggle">
							<i class="fa fa-user"></i>
						</div>
						<div class="inner-toggle dropdown-menu">
							<div class="login links">
								<?php if (!$logged) { ?>
								<?php echo $text_welcome; ?>
								<?php } else { ?>
								<?php echo $text_logged; ?>
								<?php } ?>
							</div>
						</div>
					</div>
					
					<div class="quick-cart btn-top pull-left">
						<div class="quickaccess-toggle form-control">
							<a href="<?php echo $shopping_cart; ?>"><i class="fa fa-shopping-cart"></i></a>	
						</div>
					</div>
<!--
					
					<div id="search">					
                        <div class="input-group">
                        <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" class="input-search form-control" />
                        <span class="input-group-btn">							
                            <button class="button-search" type="button"><em class="fa fa-search"></em></button>
                        </span>
                        </div>								
                    </div>
-->
				<!-- 
					<div class="quick-access pull-left">
						<div class="quickaccess-toggle">
							<i class="fa fa-tasks"></i>															
						</div>	
						<div class="inner-toggle">
							<ul class="links">									
								<li><a href="<?php echo $wishlist; ?>"><i class="fa fa-list-alt"></i><?php echo $text_wishlist; ?></a></li>
								<li><a href="<?php echo $account; ?>"><i class="fa fa-user"></i><?php echo $text_account; ?></a></li>
								<li><a href="<?php echo $shopping_cart; ?>"><i class="fa fa-bookmark"></i><?php echo $text_shopping_cart; ?></a></li>
								<li><a class="last" href="<?php echo $checkout; ?>"><i class="fa fa-share"></i><?php echo $text_checkout; ?></a></li>
							</ul>								
						</div>						
					</div>											
				
					<div class="support pull-left">
						<div class="quickaccess-toggle">
							<i class="fa fa-sun-o"></i>								
						</div>						
						<div class="inner-toggle quick-setting">
							<div class="language">
								<?php echo $language; ?>
							</div>
							<div class="currency">
								<?php echo $currency; ?>
							</div>
						</div>															
					</div> -->
				
				
				</div>


				</div>
			</div>

			<div id="header-main" class="vision-xs">
			<div id="header-main" class="vision-sm">
			<div id="header-main" class="vision-md">
			<div id="header-main" class="vision-lg">
				<div class="row">
					<div class="container-fluid">
					  <div class="row" style="margin-top: 20px;">
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-sm-offset-1 logo">
							<?php if( $logoType=='logo-theme'){ ?>
							<div id="logo-theme"><a href="<?php echo $home; ?>"><span><?php echo $name; ?></span></a></div>
							<?php } elseif ($logo) { ?>
							<div id="logo"><a href="<?php echo $home; ?>">
							<img class="logo-img"
                                src="<?php echo $logo; ?>"
                                title="<?php echo $name; ?>"
                                alt="<?php echo $name; ?>" />
                            </a></div>
							<?php } ?>					
						</div>
						<div class="phones col-lg-4 col-md-4 col-sm-9 col-xs-12">
								<p>
									<link href="callme/index.css" rel="stylesheet" />
								</p>
						 
								<div class="callme_viewform" id="tel">
									<img alt="tel" src="callme/image/tel.png" title="Заказать звонок?" />
								</div style="color: #ffffff;">
								<h1 id="number1">
								+8 (900) 304-25-75</h1>
								<h1 id="number2">
								+8 (919) 187-47-49</h1>
								<h1 id="number3">
								e-mail: info@dinas-wood.ru</h1>
								
								<div id="circle">
									<img alt="с 10:00 до 22:00 Пн-Вс" src="callme/image/circle.png" />
								</div>	
						</div> 
								<script type="text/javascript" charset="utf-8" src="/callme/js/callme.js"></script>
						
						<div class="shopping-cart hidden-xs hidden-sm col-lg-1 col-md-1 col-lg-offset-2 col-md-offset-2" style="border-radius: 5px; background-color: #ffffff; opacity: 0.75; height: 85px;">
							<div class="cart-top" style="margin-top: 10px;">
								<?php echo $cart; ?>
							</div>
						</div>
						
						<div class="hidden-xs hidden-sm inner col-lg-2 col-md-2">
							<div class="support">			
								<?php if( isset($themeConfig['support_data'][$LANGUAGE_ID]) ) { ?>
								<?php echo html_entity_decode( $themeConfig['support_data'][$LANGUAGE_ID], ENT_QUOTES, 'UTF-8' ); ?>
								<?php } ?>
							</div>			
						</div>						
						
					 </div>
						<div id="search">					
						    <div class="input-group">
							<input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" class="input-search form-control" />
							<span class="input-group-btn">							
								<button class="button-search" type="button"><em class="fa fa-search"></em></button>
							</span>
							</div>								
						</div>				 
					  
					</div>
					
						

<div style="margin: 30px 0 0 70px;">
<p style="font-variant: small-caps; font-style: italic; color: #ffffff; font-size: 30px;">Мебель с которой хочется жить!</p>
</div>					
					
				</div>
			</div>
			</div>
			</div>					
			</div>
	

		
		<div class="custom-menu">
		<div id="pav-mainnav">			
			<div class="container">
			<?php 

			/**
			* Main Menu modules: as default if do not put megamenu, the theme will use categories menu for main menu
			*/

			$modules = $helper->getModulesByPosition( 'mainmenu' ); 
			if( count($modules) && !empty($modules) ){ 

				?>

				<?php foreach ($modules as $module) { ?>
				<?php echo $module; ?>
				<?php } ?>

				<?php } elseif ($categories) {  ?>

				<div class="navbar navbar-inverse"> 
					<nav id="mainmenutop" class="pav-megamenu" role="navigation"> 
						<div class="navbar-header" style="margin: 0 auto; width: 1170px;">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="fa fa-stop"></span>
							</button>
						</div>

						<div class="collapse navbar-collapse navbar-ex1-collapse">
							<ul class="nav navbar-nav">
								<li><a href="<?php echo $home; ?>" title="<?php echo $this->language->get('text_home');?>"><?php echo $this->language->get('text_home');?></a></li>
								<?php foreach ($categories as $category) { ?>

								<?php if ($category['children']) { ?>			
								<li class="parent dropdown deeper ">
									<a href="<?php echo $category['href'];?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?>
										<b class="fa fa-angle-down"></b>
										<span class="triangles"></span>
									</a>
									<?php } else { ?>
									<li>
										<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
										<?php } ?>
										<?php if ($category['children']) { ?>
										<ul class="dropdown-menu">
											<?php for ($i = 0; $i < count($category['children']);) { ?>
											<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
											<?php for (; $i < $j; $i++) { ?>
											<?php if (isset($category['children'][$i])) { ?>
											<li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
											<?php } ?>
											<?php } ?>
											<?php } ?>
										</ul>
										<?php } ?>
									</li>
									<?php } ?>
								</ul>
							</div>	
						</nav>
					</div>   
					<?php } ?>
				</div>					
			</div>
			</div>

	</header>

<!--/**
* sys-notification
*/-->

<section id="sys-notification">
	<div class="container">
		
		<div id="notification"></div>
	</div>
</section>






<?php
/**
 * Slideshow modules
 */
$modules = $helper->getModulesByPosition( 'slideshow' );
$ospans = array(1=>3, 2=>9); 
if( $modules ){
$cols = isset($config['block_slideshow'])&& $config['block_slideshow']?(int)$config['block_slideshow']:count($modules);	
$class = $helper->calculateSpans( $ospans, $cols );
?>
<section id="pav-slideshow" class="pav-slideshow hidden-xs">
	<div class="container">
		<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
			<?php if(  $i++%$cols == 0 || count($modules)==1  ){  $j=1;?><div class="row"><?php } ?>	
			<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
			<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
	<?php  $j++;  } ?>
	</div>
</section>
<?php } ?>




<?php
/**
 * Showcase modules
 * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 */
$modules = $helper->getModulesByPosition( 'showcase' ); 
$ospans = array();

if( count($modules) ){
$cols = isset($config['block_showcase'])&& $config['block_showcase']?(int)$config['block_showcase']:count($modules);	
$class = $helper->calculateSpans( $ospans, $cols );
?>
<section class="pav-showcase" id="pavo-showcase">
	<div class="container">
		<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
		<?php if(  $i++%$cols == 0 || count($modules)==1  ){  $j=1;?><div class="row"><?php } ?>	
		<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
		<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
		<?php  $j++;  } ?>	
	</div>
</section>
<?php } ?>





<?php /*
<?php
/**
* Promotion modules
* $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]


$modules = $helper->getModulesByPosition( 'promotion' ); 
$ospans = array( 1=>9,2=>3);

if( count($modules) ){
$cols = isset($config['block_promotion'])&& $config['block_promotion']?(int)$config['block_promotion']:count($modules);	
$class = $helper->calculateSpans( $ospans, $cols );
?>
<section class="pav-promotion" id="pav-promotion">
	<div class="container">
		<?php $j=1;foreach ($modules as $i =>  $module) {?>
		<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row"><?php } ?>	
		<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
		<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
		<?php  $j++;  } ?>
	</div>	
</section>

<?php } ?>

*/ ?>






<?php if( isset($themeConfig['enable_offsidebars']) && $themeConfig['enable_offsidebars'] ) { ?>
<section id="columns" class="offcanvas-siderbars">
<div class="row visible-xs"><div class="container"> 
<!--
	<div class="offcanvas-sidebars-buttons">
		<button type="button" data-for="column-left" class="pull-left btn btn-danger btn-theme-default"><i class="fa fa-sort-amount-asc"></i> <?php echo $this->language->get('text_sidebar_left'); ?></button>
		
		<button type="button" data-for="column-right" class="pull-right btn btn-danger btn-theme-default"><?php echo $this->language->get('text_sidebar_right'); ?> <i class="fa fa-sort-amount-desc"></i></button>
	</div>
-->
</div></div>
<?php }else { ?>
<section id="columns">
<?php } ?>	