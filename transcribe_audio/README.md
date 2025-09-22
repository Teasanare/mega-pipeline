# Transcribe Audio

🎙️ &rightarrow; 📝 

In this container, you will implement the following:
* Read audio files from the GCS bucket `mega-pipeline-bucket` and folder `input_audios`
* Use the Google Cloud Speech-to-Text API
* Save the transcribed text as a text file in bucket `mega-pipeline-bucket` and folder `text_prompts` (use the same file name and change extension to .txt)

### Option 1: Build & Run Container

Build:
`docker build -t transcribe_audio -f Dockerfile .`

Run:
`docker run --rm -ti transcribe_audio`

### Option 2: Build & Run Container with Code Mount

Build:
`docker build -t transcribe_audio -f Dockerfile .`

Run:
`docker run --rm -ti -v "$(pwd)":/app transcribe_audio`

### Option 3: Build & Run Container with Code Mount + Environment Variables

Build:
`docker build -t transcribe_audio -f Dockerfile .`

Run:
`docker run --rm -ti -v "$(pwd)":/app -e GOOGLE_APPLICATION_CREDENTIALS=secrets/mega-pipeline.json transcribe_audio`

### Option 4: Docker Shell File
In this option we will combine all the above options into one shell file to make our life easy when we want to build and run containers for development.
- Make sure you are inside the `transcribe_audio` folder and open a terminal at this location
- Run `sh docker-shell.sh`

You will be automatically taken into the docker shell and you will be able to run the `cli.py` from here.

### CLI to interact with your code
* Use the given python file [`cli.py`](https://github.com/dlops-io/mega-pipeline/blob/main/transcribe_audio/cli.py)
* Assign your group-number to the `group_name` variable in `cli.py`
* The CLI should have the following command line argument options
```
python cli.py --help
usage: cli.py [-h] [-d] [-t] [-u]

Transcribe audio file to text

optional arguments:
  -h, --help        show this help message and exit
  -d, --download    Download audio files from GCS bucket
  -t, --transcribe  Transcribe audio files to text
  -u, --upload      Upload transcribed text to GCS bucket
```

### Testing your code locally
* Inside your docker shell, make sure you run the following commands:
* `python cli.py -d` - Should download all the required data from GCS bucket
* `python cli.py -t` - Should transcribe audio to text and save it locally
* `python cli.py -u` - Should upload the transcribed text to the remote GCS bucket
* Verify that your uploaded data shows up in the [Mega Pipeline App](http://ac215-mega-pipeline.dlops.io/)


