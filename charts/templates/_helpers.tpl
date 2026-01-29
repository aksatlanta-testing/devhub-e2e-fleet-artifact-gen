
{{- define "go-echoc2dce58d-2de0-4ccf-a421-27b7b3460fde.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc2dce58d-2de0-4ccf-a421-27b7b3460fde.fullname" -}}
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


{{- define "go-echoc2dce58d-2de0-4ccf-a421-27b7b3460fde.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc2dce58d-2de0-4ccf-a421-27b7b3460fde.labels" -}}
helm.sh/chart: {{ include "go-echoc2dce58d-2de0-4ccf-a421-27b7b3460fde.chart" . }}
{{ include "go-echoc2dce58d-2de0-4ccf-a421-27b7b3460fde.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc2dce58d-2de0-4ccf-a421-27b7b3460fde.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc2dce58d-2de0-4ccf-a421-27b7b3460fde.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}