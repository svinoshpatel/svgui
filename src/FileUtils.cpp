#include "FileUtils.h"
#include <QFileInfo>

FileUtils::FileUtils(QObject *parent) : QObject(parent) {}

QString FileUtils::getFileName(const QString &filePath) {
	QFileInfo info(filePath);
	return info.fileName();
};
