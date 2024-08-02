-- name: ECUcpp.lua
-- Embarcadero Cplus Builder C plus plus setting

-- set
-- SET RADSTUDIO_PATH=C:\Program Files (x86)\Embarcadero\Studio\22.0
-- SET INCLUDE_FILE_SEARCH_PATH="%RADSTUDIO_PATH%\include";"%RADSTUDIO_PATH%\include\windows\crtl";"%RADSTUDIO_PATH%\include\windows\sdk";"%RADSTUDIO_PATH%\include\windows\rtl";"%RADSTUDIO_PATH%\include\windows\vcl";"%RADSTUDIO_PATH%\include\windows\vcl"
-- SET RADSTUDIO_PATH=C:\Program Files (x86)\Embarcadero\Studio\22.0
-- set pfilelist="Opto Font Tool.cpp", "Utility.cpp", "MainFrm.cpp"
-- SET INCLUDE_FILE_SEARCH_PATH="%RADSTUDIO_PATH%\include";"%RADSTUDIO_PATH%\include\windows\crtl";"%RADSTUDIO_PATH%\include\windows\sdk";"%RADSTUDIO_PATH%\include\windows\rtl";"%RADSTUDIO_PATH%\include\windows\vcl";"%RADSTUDIO_PATH%\include\windows\fmx";"%RADSTUDIO_PATH%\hpp\Win32";"%RADSTUDIO_PATH%\include\dinkumware"
-- SET LIBRARY_SEARCH_PATH=.\Debug\Win32;"%RADSTUDIO_PATH%\lib\Win32\debug";"%RADSTUDIO_PATH%lib\win32\debug\psdk";"%RADSTUDIO_PATH%\lib\Win32\debug"
-- SET OBJECT_SEARCH_PATH=.\Debug\Win32;"%RADSTUDIO_PATH%\lib\Win32\debug";"%RADSTUDIO_PATH%\lib\win32\debug\psdk";"%RADSTUDIO_PATH%\lib\obj"
-- set object_target=.\Debug\MainFrm.obj .\Debug\Utility.obj ".\Debug\Opto Font Tool.obj"
--

-- Function to set C++ type and additional options for files starting with "ecb"
function SetCppTypeAndOptions()
  -- Get the current buffer name
  local bufname = vim.api.nvim_buf_get_name(0)

  -- Check if the file name starts with "ecb"
  if bufname:match '/ecb' or bufname:match '\\ecb' then
    -- Set specific options for files starting with "ecb"
    -- Here you can add any specific options you want to set
    -- Define the paths to include (you can customize these paths)
    -- vim.api.nvim_command 'echo "it\'s ecb"'
    vim.opt.path:append 'C:/Program Files (x86)/Embarcadero/Studio/22.0/include/windows/'
    vim.opt.path:append 'C:/Program Files (x86)/Embarcadero/Studio/22.0/include/windows/crtl/'
    vim.opt.path:append 'C:/Program Files (x86)/Embarcadero/Studio/22.0/include/windows/rtl/'
    vim.opt.path:append 'C:/Program Files (x86)/Embarcadero/Studio/22.0/include/windows/vcl/'
    vim.opt.path:append 'C:/Program Files (x86)/Embarcadero/Studio/22.0/include/windows/fmx/'
    vim.opt.path:append 'C:/Program Files (x86)/Embarcadero/Studio/22.0/include/windows/sdk/'
  end

  local paths = {
    '.',
    'c:/Program Files (x86)/Embarcadero/Studio/22.0/include/',
    'c:/Program Files (x86)/Embarcadero/Studio/22.0/include/crtl/',
    'c:/Program Files (x86)/Embarcadero/Studio/22.0/include/rtl/',
    'c:/Program Files (x86)/Embarcadero/Studio/22.0/include/vcl/',

    'c:/Program Files (x86)/Embarcadero/Studio/22.0/include/fmx/',
    'c:/Program Files (x86)/Embarcadero/Studio/22.0/include/sdk/',
  }

  -- Convert the paths table to a comma-separated string
  -- local path_string = table.concat(paths, ',')

  -- print(type(path_string))
  -- Set the 'path' option for the current buffer
  -- vim.api.nvim_buf_set_option(tonumber(bufname), 'path', path_string)
end

-- Create an autocmd to call the function when opening a C++ file
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.cpp', '*.cxx', '*.cc', '*.h', '*.hpp' },
  callback = SetCppTypeAndOptions,
})
