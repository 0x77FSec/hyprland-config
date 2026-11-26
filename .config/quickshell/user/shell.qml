import Quickshell
import "launcher"
import Quickshell.Io
import "volume"

ShellRoot {

	Volume{

	}

IpcHandler {
	target: "controlCenter"


	function open() {
	GlobalState.controlCenter= true
  }
	function close() {
	GlobalState.controlCenter = false
  }
  	function toggle() {
 	GlobalState.controlCenter = !GlobalState.controlCenter
  }	

 }

}
