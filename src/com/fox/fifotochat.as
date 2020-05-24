import com.GameInterface.Chat;
import com.Utils.LDBFormat;
class com.fox.fifotochat{
	static var WhiteListedFifo:Array =  [
		//LDBFormat.LDBGetText(20000, 265679253).split("%s")[1],
		LDBFormat.LDBGetText(100, 111728052).split("%s")[1], // %s didn't want to join your group.
		LDBFormat.LDBGetText(100, 158469822).split("%s")[1], // %s didn't want to join your raid.
		LDBFormat.LDBGetText(100, 235410148).split("%s")[0] // The invite to %s timed out.
	]
	public static function main(swfRoot:MovieClip):Void{
		var s_app = new fifotochat(swfRoot);
		swfRoot.onLoad = function(){s_app.Load()};
		swfRoot.onUnload = function(){s_app.Unload()};
	}

	public function fifotochat() {}
	public function Load(){Chat.SignalShowFIFOMessage.Connect(SlotFifo, this)}
	public function Unload(){Chat.SignalShowFIFOMessage.Disconnect(SlotFifo,this)}
	public function SlotFifo(msg:String){
		for (var i in WhiteListedFifo){
			if (msg.indexOf(WhiteListedFifo[i]) >= 0){
				com.GameInterface.UtilsBase.PrintChatText(msg);
			}
		}
	}
	
}