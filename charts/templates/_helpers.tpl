
{{- define "go-echoffea3c92-f03d-4774-90a6-aee4db2fb14a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffea3c92-f03d-4774-90a6-aee4db2fb14a.fullname" -}}
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


{{- define "go-echoffea3c92-f03d-4774-90a6-aee4db2fb14a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffea3c92-f03d-4774-90a6-aee4db2fb14a.labels" -}}
helm.sh/chart: {{ include "go-echoffea3c92-f03d-4774-90a6-aee4db2fb14a.chart" . }}
{{ include "go-echoffea3c92-f03d-4774-90a6-aee4db2fb14a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoffea3c92-f03d-4774-90a6-aee4db2fb14a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoffea3c92-f03d-4774-90a6-aee4db2fb14a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}