
{{- define "go-echo13da66e7-dcb3-478b-8e82-d7024922f49d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo13da66e7-dcb3-478b-8e82-d7024922f49d.fullname" -}}
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


{{- define "go-echo13da66e7-dcb3-478b-8e82-d7024922f49d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo13da66e7-dcb3-478b-8e82-d7024922f49d.labels" -}}
helm.sh/chart: {{ include "go-echo13da66e7-dcb3-478b-8e82-d7024922f49d.chart" . }}
{{ include "go-echo13da66e7-dcb3-478b-8e82-d7024922f49d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo13da66e7-dcb3-478b-8e82-d7024922f49d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo13da66e7-dcb3-478b-8e82-d7024922f49d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}