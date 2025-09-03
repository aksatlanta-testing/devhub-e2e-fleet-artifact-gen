
{{- define "go-echof9a75af9-4a24-4273-8a4c-7a53a2d05711.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof9a75af9-4a24-4273-8a4c-7a53a2d05711.fullname" -}}
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


{{- define "go-echof9a75af9-4a24-4273-8a4c-7a53a2d05711.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof9a75af9-4a24-4273-8a4c-7a53a2d05711.labels" -}}
helm.sh/chart: {{ include "go-echof9a75af9-4a24-4273-8a4c-7a53a2d05711.chart" . }}
{{ include "go-echof9a75af9-4a24-4273-8a4c-7a53a2d05711.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof9a75af9-4a24-4273-8a4c-7a53a2d05711.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof9a75af9-4a24-4273-8a4c-7a53a2d05711.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}