use serde::{Serialize, Deserialize};

// All paths are relative to the project file so that projects can be zipped up and moved between machines easily
// All non image and audio data is stored in text formats that can be version controlled easily

pub const PROJECT_FILEINFO_FOLDER: &str = "./audio_infos";

pub const PROJECT_FORMAT_VERSION: u64 = 1;
#[derive(Serialize, Deserialize)]
pub struct ProjectFile
{
    pub version: u64,
    pub project_name: String,
}

impl Default for ProjectFile
{
    fn default() -> Self
    {
        ProjectFile
        {
            version: PROJECT_FORMAT_VERSION,
            project_name: "".to_string()
        }
    }
}


pub const AFI_FORMAT_VERSION: u64 = 1;
#[derive(Serialize, Deserialize)]
pub struct AudioFileInfo
{
    pub version: u64,
    pub wav_path: String,
    pub lab_path: String,
    pub wave_img_path: String,
    pub spec_img_path: String
}

impl Default for AudioFileInfo
{
    fn default() -> Self
    {
        AudioFileInfo
        {
            version: AFI_FORMAT_VERSION,
            wav_path: "".to_string(),
            lab_path: "".to_string(),
            wave_img_path: "".to_string(),
            spec_img_path: "".to_string(),
        }
    }
}
