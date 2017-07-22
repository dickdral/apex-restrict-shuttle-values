# Oracle APEX Dynamic Action Plugin -  Restrict shuttle values
Oracle Apex plug-in for restricting the shuttle values using a user defined input.
The chosen values are not affected. The words in the user input are treated seperately
and case insensitive:
- the input 'change 2016' will show all options with both the text change and 2016.

## Change history
- V1.0    Initial version
- V1.1    Support for Safari and IE added, other items than search item can be triggering element
- V1.2    Fixed error in JS. Pressing Enter is ignored to prevent submit. 

## Requirements
The plugin can be used with Apex 5.0 and Apex 5.1.

## Install
- Import plugin file "dynamic_action_plugin_nl_detora_apex_restrict_shuttle_values.sql" from source directory into your application
- You can use the plug-in to restrict the value list of Apex shuttle items

## Plugin Settings
You can use the plug-in as Action Step in a Dynamic Action.
To use the plug-in:
- the attribute Search Item needs to reference the item containing the filter content
- the Affected element needs to point to the shuttle item

## Demo Application
http://www.speech2form.com/ords/f?p=OPFG:RESTRICT_SHUTTLE

## Preview
![](https://raw.githubusercontent.com/dickdral/apex-copy_to_clipboard/master/restrict_shuttle_values_example.gif?raw=true)
---
