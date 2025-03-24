
{{- define "go-echoa2d185e3-4fd4-4677-a199-687069c4dc7b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2d185e3-4fd4-4677-a199-687069c4dc7b.fullname" -}}
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


{{- define "go-echoa2d185e3-4fd4-4677-a199-687069c4dc7b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2d185e3-4fd4-4677-a199-687069c4dc7b.labels" -}}
helm.sh/chart: {{ include "go-echoa2d185e3-4fd4-4677-a199-687069c4dc7b.chart" . }}
{{ include "go-echoa2d185e3-4fd4-4677-a199-687069c4dc7b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa2d185e3-4fd4-4677-a199-687069c4dc7b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa2d185e3-4fd4-4677-a199-687069c4dc7b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}