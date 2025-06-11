
{{- define "go-echofd98c27b-1523-4e60-9267-62743efb6991.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd98c27b-1523-4e60-9267-62743efb6991.fullname" -}}
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


{{- define "go-echofd98c27b-1523-4e60-9267-62743efb6991.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd98c27b-1523-4e60-9267-62743efb6991.labels" -}}
helm.sh/chart: {{ include "go-echofd98c27b-1523-4e60-9267-62743efb6991.chart" . }}
{{ include "go-echofd98c27b-1523-4e60-9267-62743efb6991.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofd98c27b-1523-4e60-9267-62743efb6991.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd98c27b-1523-4e60-9267-62743efb6991.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}