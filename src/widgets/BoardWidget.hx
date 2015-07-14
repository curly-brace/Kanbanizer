package widgets;

import flash.events.Event;
import openfl.events.MouseEvent;
import openfl.events.TimerEvent;
import openfl.utils.Timer;
import ru.stablex.ui.Dnd;
import ru.stablex.ui.events.WidgetEvent;
import ru.stablex.ui.layouts.Column;
import ru.stablex.ui.layouts.Row;
import ru.stablex.ui.skins.Layer;
import ru.stablex.ui.skins.Paint;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Bmp;
import ru.stablex.ui.widgets.Button;
import ru.stablex.ui.widgets.Progress;
import ru.stablex.ui.widgets.Text;
import ru.stablex.ui.widgets.Widget;


class BoardWidget extends Widget {
	public var color(default, set):Int = 0x008cac;
	function set_color(c) {
		panel.skin.as(Layer).current.as(Paint).color = c;
		panel.refresh();
		return color = c;
	}
	
	public var text(default, set):String = 'board';
	function set_text(txt) {
		return caption.text = txt;
	}
	
	public var iconAsset(default, set):String;
	function set_iconAsset(src) {
		icon.src = src;
		icon.refresh();
		return iconAsset = src;
	}
	
	private var caption:Text;
	private var menuButton:Button;
	private var panel:Widget;
	private var icon:Bmp;
	private var cardCounterText:Text;
	private var listCounterText:Text;
	private var createdOnText:Text;
	private var ageText:Text;
	private var timeSpentText:Text;
	private var lastActivityText:Text;
	private var progress:Progress;
	private var infoCounterText:Text;
	private var alertCounterText:Text;
	
	public function new() {
		super();
		
		layout = new Row();
		layout.as(Row).rows = [32, -1];
		
		addChild(UIBuilder.create(Widget, {
			defaults: 'SizableHeader',
			widthPt: 100,
			children: [
				caption = UIBuilder.create(Text, {
					text: this.text,
					w: 220,
					label: {
						wordWrap: true
					},
					top: 4,
					left: 4,
				}),
				menuButton = UIBuilder.create(Button, {
					defaults: 'SmallMenu',
					top: 4,
					left: 222,
				})
			]
		}));
		
		addChild(UIBuilder.create(Widget, {
			defaults: 'SizablePanel',
			widthPt: 100,
			skin: { current: { color: this.color } },
			children: [
				UIBuilder.create(Widget, {
					heightPt: 100,
					widthPt: 100,
					layout: {
						var l = new Row();
						l.rows = [-1, 16, -1, 16, -1, 16, -1, 16, -1, 8, -1, 16, -1];
						l.cellPadding = 0;
						l.paddingTop = 0;
						l.paddingBottom = 0;
						l.paddingLeft = 4;
						l.paddingRight = 4;
						l;
					},
					children: [
						UIBuilder.create(Widget),
						UIBuilder.create(Widget, {
							layout: {
								var l = new Column();
								l.cols = [40, 16, -1, 16, -1];
								l;
							},
							children: [
								UIBuilder.create(Widget),
								UIBuilder.create(Widget, { skinName: 'cardsIcon' } ),
								cardCounterText = UIBuilder.create(Text, { defaults: 'Condensed', text: '123' } ),
								UIBuilder.create(Widget, { skinName: 'listsIcon' } ),
								listCounterText = UIBuilder.create(Text, { defaults: 'Condensed', text: '13' } )
							]
						}),
						UIBuilder.create(Widget),
						UIBuilder.create(Widget, {
							layout: {
								var l = new Column();
								l.cols = [40, 16, -1, 16, -1];
								l;
							},
							children: [
								UIBuilder.create(Widget),
								UIBuilder.create(Widget, { skinName: 'createdOnIcon' } ),
								createdOnText = UIBuilder.create(Text, { defaults: 'Condensed', text: '21.12.2012' } ),
								UIBuilder.create(Widget, { skinName: 'ageIcon' } ),
								ageText = UIBuilder.create(Text, { defaults: 'Condensed', text: '256d 12m 31d' } )
							]
						}),
						UIBuilder.create(Widget),
						UIBuilder.create(Widget, {
							layout: {
								var l = new Column();
								l.cols = [40, 16, -1];
								l;
							},
							children: [
								UIBuilder.create(Widget),
								UIBuilder.create(Widget, { skinName: 'timeSpentIcon' } ),
								timeSpentText = UIBuilder.create(Text, { defaults: 'Condensed', text: '256d 12m 31d 24h 30m' } ),
							]
						}),
						UIBuilder.create(Widget),
						UIBuilder.create(Widget, {
							layout: {
								var l = new Column();
								l.cols = [40, 16, -1];
								l;
							},
							children: [
								UIBuilder.create(Widget),
								UIBuilder.create(Widget, { skinName: 'lastActivityIcon' } ),
								lastActivityText = UIBuilder.create(Text, { defaults: 'Condensed', text: '256d 12m 31d 24h 30m' } ),
							]
						}),
						UIBuilder.create(Widget),
						progress = UIBuilder.create(Progress, { value: 50 } ),
						UIBuilder.create(Widget),
						UIBuilder.create(Widget, {
							layout: {
								var l = new Column();
								l.cols = [16, -1, 16, -1];
								l;
							},
							children: [
								UIBuilder.create(Widget, { skinName: 'infoIcon' } ),
								infoCounterText = UIBuilder.create(Text, { defaults: 'Condensed', text: '123' } ),
								UIBuilder.create(Widget, { skinName: 'alertIcon' } ),
								alertCounterText = UIBuilder.create(Text, { defaults: 'Condensed', text: '666' } )
							]
						}),
					]
				}),
				icon = UIBuilder.create(Bmp, {
					w: 32,
					h: 32,
					top: 4,
					left: 4
				})
			]
		}));
		
		caption.addEventListener(WidgetEvent.RESIZE, onCaptionResize);
		
		this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
	}
	
	private function onCaptionResize(e:WidgetEvent):Void {
		this.layout.as(Row).rows[0] = this.caption.label.height + 6;
		this.refresh();
	}
	
	private function onMenuClick():Void {
		trace('click');
	}
	
	private function mouseDown(e:MouseEvent) {
		if (e.target == menuButton) return onMenuClick();
		
		Dnd.drag(this, Registry.dragRoot);
	}
	
}