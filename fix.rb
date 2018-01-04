require 'sketchup.rb'


def fix
	$model = Sketchup.active_model
	$entities = model.active_entities
	select=Sketchup.active_model.selection
	face=Sketchup.select.send_action 21056
	return true
end
def find_png(file_name="") #查找png图片，获取全路径名
	path=Sketchup.find_support_file file_name,"plugins/image"
	return path
end
#添加菜单
pmenu=UI.menu("Plugins") #"扩展程序"菜单栏
submenu=pmenu.add_submenu("FACE") #添加子菜单
submenu.add_item("fix"){fix}

#添加工具栏
toolbar = UI::Toolbar.new "FACE"

cmd = UI::Command.new("FACE"){fix}
cmd.small_icon =find_png "area.png"
cmd.large_icon =find_png "area.png"
cmd.tooltip = "fix"
cmd.status_bar_text = "fix"
cmd.menu_text = "fix"
toolbar = toolbar.add_item cmd
toolbar.show
