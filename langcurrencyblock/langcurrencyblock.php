<?php
if (!defined('_PS_VERSION_'))
	exit;

class langcurrencyblock extends Module
{
	public function __construct()
	{
		$this->name = 'langcurrencyblock';
		$this->tab = 'front_office_features';
		$this->version = '1.0.0';
		$this->author = 'Walter Leong';
		$this->need_instance = 0;

		$this->bootstrap = true;
		parent::__construct();

		$this->displayName = $this->l('Language and Currency Block');
		$this->description = $this->l('Contains language and currency block in navigation.');
		$this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
	}

	 public function hookDisplayTop()
	 {
	 	return $this->display(__FILE__, 'topBlock.tpl');
	 }

	public function hookHeader()
	{
		$this->context->controller->addCSS($this->_path.'/views/css/langcurrencyblock.css');
	}
	public function install()
	{
		if (!parent::install()
			||!$this->registerHook('displayTop')
			||!$this->registerHook('header'))
			return false;
		return true;
	}

	public function uninstall()
	{
		if(!parent::uninstall())
			return false;
		return true;
	}
}
