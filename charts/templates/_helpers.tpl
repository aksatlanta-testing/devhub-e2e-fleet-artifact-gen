
{{- define "go-echoaa5629c4-f6d6-49e4-8f42-68af2d37b6fc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa5629c4-f6d6-49e4-8f42-68af2d37b6fc.fullname" -}}
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


{{- define "go-echoaa5629c4-f6d6-49e4-8f42-68af2d37b6fc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa5629c4-f6d6-49e4-8f42-68af2d37b6fc.labels" -}}
helm.sh/chart: {{ include "go-echoaa5629c4-f6d6-49e4-8f42-68af2d37b6fc.chart" . }}
{{ include "go-echoaa5629c4-f6d6-49e4-8f42-68af2d37b6fc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaa5629c4-f6d6-49e4-8f42-68af2d37b6fc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaa5629c4-f6d6-49e4-8f42-68af2d37b6fc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}