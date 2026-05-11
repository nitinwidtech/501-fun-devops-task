resource "azurerm_storage_container" "raw_videos" {
  name                  = "raw-videos"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}

resource "azurerm_storage_container" "processed_videos" {
  name                  = "processed-videos"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}

resource "azurerm_storage_queue" "video_jobs" {
  name                 = "video-processing-jobs"
  storage_account_name = var.storage_account_name
}