
{{- define "go-echob2c864ef-bef8-4588-90c3-baaeae071fbc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob2c864ef-bef8-4588-90c3-baaeae071fbc.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echob2c864ef-bef8-4588-90c3-baaeae071fbc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob2c864ef-bef8-4588-90c3-baaeae071fbc.labels" -}}
helm.sh/chart: {{ include "go-echob2c864ef-bef8-4588-90c3-baaeae071fbc.chart" . }}
{{ include "go-echob2c864ef-bef8-4588-90c3-baaeae071fbc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob2c864ef-bef8-4588-90c3-baaeae071fbc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob2c864ef-bef8-4588-90c3-baaeae071fbc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}