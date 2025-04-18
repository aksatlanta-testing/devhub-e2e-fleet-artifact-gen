
{{- define "go-echo7debed0b-b0c5-4b28-a03f-31bdeb806855.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7debed0b-b0c5-4b28-a03f-31bdeb806855.fullname" -}}
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


{{- define "go-echo7debed0b-b0c5-4b28-a03f-31bdeb806855.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7debed0b-b0c5-4b28-a03f-31bdeb806855.labels" -}}
helm.sh/chart: {{ include "go-echo7debed0b-b0c5-4b28-a03f-31bdeb806855.chart" . }}
{{ include "go-echo7debed0b-b0c5-4b28-a03f-31bdeb806855.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7debed0b-b0c5-4b28-a03f-31bdeb806855.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7debed0b-b0c5-4b28-a03f-31bdeb806855.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}