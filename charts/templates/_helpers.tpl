
{{- define "go-echo3ec15470-8857-48d2-bfd9-605d087cbaeb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3ec15470-8857-48d2-bfd9-605d087cbaeb.fullname" -}}
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


{{- define "go-echo3ec15470-8857-48d2-bfd9-605d087cbaeb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3ec15470-8857-48d2-bfd9-605d087cbaeb.labels" -}}
helm.sh/chart: {{ include "go-echo3ec15470-8857-48d2-bfd9-605d087cbaeb.chart" . }}
{{ include "go-echo3ec15470-8857-48d2-bfd9-605d087cbaeb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3ec15470-8857-48d2-bfd9-605d087cbaeb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3ec15470-8857-48d2-bfd9-605d087cbaeb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}