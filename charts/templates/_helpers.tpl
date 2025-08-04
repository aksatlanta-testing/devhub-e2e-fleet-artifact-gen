
{{- define "go-echo65875a24-672f-40fd-a9de-3579b1b55c01.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo65875a24-672f-40fd-a9de-3579b1b55c01.fullname" -}}
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


{{- define "go-echo65875a24-672f-40fd-a9de-3579b1b55c01.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo65875a24-672f-40fd-a9de-3579b1b55c01.labels" -}}
helm.sh/chart: {{ include "go-echo65875a24-672f-40fd-a9de-3579b1b55c01.chart" . }}
{{ include "go-echo65875a24-672f-40fd-a9de-3579b1b55c01.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo65875a24-672f-40fd-a9de-3579b1b55c01.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo65875a24-672f-40fd-a9de-3579b1b55c01.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}