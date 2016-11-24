<?php  
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle('Интернет-магазин мебели Dinas Wood - купить качественную мебель в Воронеже, Липецке, Туле, Смоленске, Бердянске и Курске недорого с ценами, фото, доставкой по Россие');
		$this->document->setDescription('Мебель для дома и офиса &amp;#10004; по низким ценам &amp;#10004; доставка по России, предлагает купить интернет-магазин меблели. Мебельный каталог с фото и описанием вы можете купить с нашего сайта Динас-Вуд.ру! На сайте дешевле! &amp;#9742;');
        $this->document->setKeywords('купить мебель, каталог, цены, продажа, фото, купить диван недорого,кровати, столы, кресла, стулья, Динас вуд, Dinas wood,');
		$this->data['heading_title'] = $this->config->get('config_title');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
										
		$this->response->setOutput($this->render());
	}
}
?>