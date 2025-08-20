
{{- define "go-echo5d7b9d34-64e6-4c04-848f-f93a599a7846.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5d7b9d34-64e6-4c04-848f-f93a599a7846.fullname" -}}
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


{{- define "go-echo5d7b9d34-64e6-4c04-848f-f93a599a7846.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5d7b9d34-64e6-4c04-848f-f93a599a7846.labels" -}}
helm.sh/chart: {{ include "go-echo5d7b9d34-64e6-4c04-848f-f93a599a7846.chart" . }}
{{ include "go-echo5d7b9d34-64e6-4c04-848f-f93a599a7846.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5d7b9d34-64e6-4c04-848f-f93a599a7846.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5d7b9d34-64e6-4c04-848f-f93a599a7846.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}