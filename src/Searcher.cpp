#include "Searcher.h"

Searcher::Searcher(QObject *parent) : QObject(parent) {}

QVector<int> Searcher::search(const QString &text, const QString &pattern)
{
	QVector<int> positions;
	if (pattern.isEmpty()) return positions;

	int n = text.length();
	int m = pattern.length();

	for (int i = 0; i <= n - m; ++i) {
		if (text.mid(i, m).compare(pattern, Qt::CaseInsensitive) == 0) {
			positions.append(i);			
		}
	}
	return positions;
};
