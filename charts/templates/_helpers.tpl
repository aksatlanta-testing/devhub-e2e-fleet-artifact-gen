
{{- define "go-echof8fc532e-19eb-46ae-9c69-4c9c183bc66d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8fc532e-19eb-46ae-9c69-4c9c183bc66d.fullname" -}}
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


{{- define "go-echof8fc532e-19eb-46ae-9c69-4c9c183bc66d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8fc532e-19eb-46ae-9c69-4c9c183bc66d.labels" -}}
helm.sh/chart: {{ include "go-echof8fc532e-19eb-46ae-9c69-4c9c183bc66d.chart" . }}
{{ include "go-echof8fc532e-19eb-46ae-9c69-4c9c183bc66d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof8fc532e-19eb-46ae-9c69-4c9c183bc66d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof8fc532e-19eb-46ae-9c69-4c9c183bc66d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}