output "raw_videos_container" {
  value = azurerm_storage_container.raw_videos.name
}

output "processed_videos_container" {
  value = azurerm_storage_container.processed_videos.name
}

output "video_jobs_queue" {
  value = azurerm_storage_queue.video_jobs.name
}