# wandouRecordRepairCommand
bilibili主播[@一只萌豌豆](https://space.bilibili.com/10867865)的[直播](https://live.bilibili.com/1123)[录像](https://space.bilibili.com/28608788/search/video?keyword=%E4%B8%80%E5%8F%AA%E8%90%8C%E8%B1%8C%E8%B1%86)修复命令

## How to use
* bat命令均使用批量拖拽方式
1. FLV使用小丸工具箱（音频-批量处理（->WAV）） 或者 将FLV拖入`flv2wav.bat`，得到WAV
2. 使用Goldwave的批处理功能（文件菜单-批处理，在`处理`标签页选择`添加编辑`，选择`插入静音`，填入`0.35`s，插入位置选择`文件开头`，在`来源`处拖入WAV文件，`目标`标签选择`覆盖已存在的文件`，点击确定）（主要是嫌ffmpeg的太麻烦）
3. 将上一步处理完的WAV拖入`wav2aac2mux&delete.bat`，等待结束。最终得到mux结尾的mp4文件

## Acknowledgements
- 小丸工具箱（主要命令来自小丸，封装成批处理减少手动调用）
- ffmpeg
- NeroAAC
