
{{- define "go-echoead6a429-36a9-4093-8054-c44e082f8a75.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoead6a429-36a9-4093-8054-c44e082f8a75.fullname" -}}
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


{{- define "go-echoead6a429-36a9-4093-8054-c44e082f8a75.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoead6a429-36a9-4093-8054-c44e082f8a75.labels" -}}
helm.sh/chart: {{ include "go-echoead6a429-36a9-4093-8054-c44e082f8a75.chart" . }}
{{ include "go-echoead6a429-36a9-4093-8054-c44e082f8a75.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoead6a429-36a9-4093-8054-c44e082f8a75.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoead6a429-36a9-4093-8054-c44e082f8a75.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}