
{{- define "go-echod191e8d9-2f7e-4788-a6fa-547dcb88eb3a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod191e8d9-2f7e-4788-a6fa-547dcb88eb3a.fullname" -}}
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


{{- define "go-echod191e8d9-2f7e-4788-a6fa-547dcb88eb3a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod191e8d9-2f7e-4788-a6fa-547dcb88eb3a.labels" -}}
helm.sh/chart: {{ include "go-echod191e8d9-2f7e-4788-a6fa-547dcb88eb3a.chart" . }}
{{ include "go-echod191e8d9-2f7e-4788-a6fa-547dcb88eb3a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod191e8d9-2f7e-4788-a6fa-547dcb88eb3a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod191e8d9-2f7e-4788-a6fa-547dcb88eb3a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}