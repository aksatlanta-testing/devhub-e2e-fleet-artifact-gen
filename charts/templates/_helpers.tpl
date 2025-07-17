
{{- define "go-echo7a8abc1b-a318-4ba0-a6a1-505ad687ebab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a8abc1b-a318-4ba0-a6a1-505ad687ebab.fullname" -}}
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


{{- define "go-echo7a8abc1b-a318-4ba0-a6a1-505ad687ebab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a8abc1b-a318-4ba0-a6a1-505ad687ebab.labels" -}}
helm.sh/chart: {{ include "go-echo7a8abc1b-a318-4ba0-a6a1-505ad687ebab.chart" . }}
{{ include "go-echo7a8abc1b-a318-4ba0-a6a1-505ad687ebab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7a8abc1b-a318-4ba0-a6a1-505ad687ebab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7a8abc1b-a318-4ba0-a6a1-505ad687ebab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}