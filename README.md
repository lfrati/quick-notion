# quick-notion
Notion is very useful to store thoughts and ideas. But wouldn't it be nice to use our preferred editor when editing our thought and then push it to Notion with a simple command?

# Instructions
- Step 1. Create an [integration](https://www.notion.so/my-integrations) from the Notion website:
<img width="400" src="https://github.com/lfrati/quick-notion/assets/3115640/5269323f-6ad2-41fb-bd31-d29a4fe97902">

- Step 2. Connect the integration to the desired page:
<img width="400" src="https://github.com/lfrati/quick-notion/assets/3115640/2f36237c-228d-4e0a-a41e-e186593287b9">

- Step 3. Run the [setup](create.sh) script, it will request the url of the page to upload notes to (the same one we just connected our integration to) and the secret key of the integration we created in Step 1.

- Step 4. Use `./upload.sh <FILENAME>` to upload the text in a desired file contents to notion using the [notion api](https://developers.notion.com/reference/patch-block-children). You can use `:! ./upload.sh %:p` to upload the contents of the current file from VIM.
  
| Uploading Note  | Here we go! |
| ------------- | ------------- |
| <img width="400" src="https://github.com/lfrati/quick-notion/assets/3115640/24a89019-a057-4a5b-a390-4585f39d5bb7">  | <img width="400" src="https://github.com/lfrati/quick-notion/assets/3115640/639433ac-4036-4bd5-92d5-be444900aedd">  |
