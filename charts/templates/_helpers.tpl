
{{- define "go-echo08c380b7-b49c-4cce-a1da-52af96f8221f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08c380b7-b49c-4cce-a1da-52af96f8221f.fullname" -}}
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


{{- define "go-echo08c380b7-b49c-4cce-a1da-52af96f8221f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08c380b7-b49c-4cce-a1da-52af96f8221f.labels" -}}
helm.sh/chart: {{ include "go-echo08c380b7-b49c-4cce-a1da-52af96f8221f.chart" . }}
{{ include "go-echo08c380b7-b49c-4cce-a1da-52af96f8221f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo08c380b7-b49c-4cce-a1da-52af96f8221f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo08c380b7-b49c-4cce-a1da-52af96f8221f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}