
{{- define "go-echo1a5799d7-e850-4ae7-8806-f9a65c67eecf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a5799d7-e850-4ae7-8806-f9a65c67eecf.fullname" -}}
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


{{- define "go-echo1a5799d7-e850-4ae7-8806-f9a65c67eecf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a5799d7-e850-4ae7-8806-f9a65c67eecf.labels" -}}
helm.sh/chart: {{ include "go-echo1a5799d7-e850-4ae7-8806-f9a65c67eecf.chart" . }}
{{ include "go-echo1a5799d7-e850-4ae7-8806-f9a65c67eecf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1a5799d7-e850-4ae7-8806-f9a65c67eecf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1a5799d7-e850-4ae7-8806-f9a65c67eecf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}