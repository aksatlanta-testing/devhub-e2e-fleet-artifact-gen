
{{- define "go-echoa4d0777a-c1d8-4daf-9265-9e700e6b1721.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4d0777a-c1d8-4daf-9265-9e700e6b1721.fullname" -}}
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


{{- define "go-echoa4d0777a-c1d8-4daf-9265-9e700e6b1721.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4d0777a-c1d8-4daf-9265-9e700e6b1721.labels" -}}
helm.sh/chart: {{ include "go-echoa4d0777a-c1d8-4daf-9265-9e700e6b1721.chart" . }}
{{ include "go-echoa4d0777a-c1d8-4daf-9265-9e700e6b1721.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4d0777a-c1d8-4daf-9265-9e700e6b1721.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4d0777a-c1d8-4daf-9265-9e700e6b1721.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}