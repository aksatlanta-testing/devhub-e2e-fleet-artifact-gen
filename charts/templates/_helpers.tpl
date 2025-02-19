
{{- define "go-echoa5f7dd3e-ffc8-4563-a013-da64217ec765.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa5f7dd3e-ffc8-4563-a013-da64217ec765.fullname" -}}
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


{{- define "go-echoa5f7dd3e-ffc8-4563-a013-da64217ec765.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa5f7dd3e-ffc8-4563-a013-da64217ec765.labels" -}}
helm.sh/chart: {{ include "go-echoa5f7dd3e-ffc8-4563-a013-da64217ec765.chart" . }}
{{ include "go-echoa5f7dd3e-ffc8-4563-a013-da64217ec765.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa5f7dd3e-ffc8-4563-a013-da64217ec765.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa5f7dd3e-ffc8-4563-a013-da64217ec765.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}